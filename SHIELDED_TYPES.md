# Shielded Types: Privacy Edge Cases and Limitations

This document describes known edge cases and privacy limitations of shielded types
(`suint`, `sbool`, `saddress`, `sbytes`). Understanding these is critical to
building applications that preserve confidentiality.

## 1. `msg.value` Is Always Public

`msg.value` is a transaction-level field that is publicly visible on-chain. Assigning
it to a shielded type does **not** retroactively hide the value:

```solidity
function deposit() public payable {
    // WARNING: msg.value was already visible in the transaction.
    // Wrapping it in a shielded type does not hide the deposited amount.
    suint256 amount = suint256(msg.value);
}
```

If your application requires private ETH amounts, you must use a separate wrapped
token design (e.g., a shielded ERC-20) rather than relying on native ETH transfers.

## 2. Dynamic Shielded Array Lengths

Dynamic arrays with shielded element types store their length in confidential storage.
However, **an upper bound on the array length may still be observable** through gas
cost analysis. Each `push` or `pop` operation consumes gas proportional to the work
performed, and an observer monitoring gas usage may be able to infer whether elements
were added or removed, and estimate the size of the array over time.

For arrays of structs with mixed shielded and non-shielded fields (e.g., some
`uint256` and some `suint256`), the length can be deduced by querying the public
storage slots of the non-shielded fields.

Fixed-length shielded arrays always have a public length by definition, since the
length is part of the type itself.

## 3. ABI Encoding and Shielded Types

Shielded types **cannot** be ABI-encoded. The compiler rejects calls such as
`abi.encode(shieldedValue)` to prevent accidental plaintext serialization.

When explicitly casting a shielded value to its public counterpart (e.g.,
`uint256(myShieldedValue)`) and then ABI-encoding the result, be aware that the
value is revealed at the point of casting. Any intermediary or observer of the
execution trace may see the unshielded value. Only cast from shielded to public
when you intentionally want to reveal the data.

## 4. Shielded Booleans in Branching Conditions

Using an `sbool` (or an expression producing `sbool`) in control-flow constructs
— `if`, `while`, `for`, ternary `? :`, `require()`, `assert()` — can leak
information. Although the boolean value itself is shielded, the *branch taken* is
observable through:

- **Gas cost differences** between the two branches
- **State changes** that only occur in one branch
- **Execution traces** visible to sequencers / block builders

The compiler emits a warning when shielded types are used in branching conditions.

## 5. `saddress` Member Limitations

Shielded addresses (`saddress`) only expose the `.code` and `.codehash` members.
Other address members (`.balance`, `.transfer()`, `.send()`, `.call()`, etc.)
require casting to a public `address` first:

```solidity
saddress secret = saddress(someAddr);
// secret.balance;           // ERROR
// address(secret).balance;  // OK — but reveals the address
```

Accessing these members inherently requires revealing the address on-chain, which
is why the cast must be explicit.

## 6. Literal Values Leak During Deployment

Literal values that are converted to shielded types at contract construction time
will be visible in the deployment bytecode:

```solidity
suint256 private constant SECRET = suint256(42); // 42 is visible in deploy tx
```

The compiler warns when it detects literals being directly converted to shielded
types. To keep values confidential, pass them as encrypted constructor arguments
or set them via a post-deployment transaction.

## 7. Shielded Dynamic Bytes (`sbytes`)

The `sbytes` type is a dynamic shielded byte array. It uses the same packed storage
encoding as `bytes` (32 bytes per slot, short/long encoding) but stores all data —
including the array length — in confidential storage via `cstore`/`cload`.

```solidity
sbytes data;
data.push(sbytes1(0x42));  // push a shielded byte
sbytes1 val = data[0];     // read a shielded byte
suint256 len = data.length; // length is shielded (suint256)
```

**Privacy note:** Like other dynamic shielded arrays, an upper bound on the length
may still be observable through gas cost analysis (see Section 2).

**Limitations:**
- `sbytes` cannot be used in public state variables, public/external function
  parameters or return values, events, or errors.
- `sbytes` cannot be ABI-encoded.
- `sbytes` is not convertible to/from `bytes` or `string`.
- Shielded `string` (`sstring`) is **not supported**.
