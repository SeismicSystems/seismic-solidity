# Seismic's Extension to the Ethereum Virtual Machine (EVM)

### Introduction

Welcome to the documentation for our confidential storage extension to the Ethereum Virtual Machine (EVM). This extension introduces confidential storage capabilities, allowing developers to handle sensitive data securely within smart contracts. By building upon the existing EVM infrastructure, we've added minimal changes to ensure ease of adoption and maintain compatibility.

This documentation highlights the differences from Cancun's Ethereum version to focus on the new features introduced by Seismic's Mercury version. We recommend familiarizing yourself with the standard Ethereum documentation alongside this guide.

Indeed, this work wouldn’t have been possible without an incredible, nearly decade-long effort to build Solidity. As such, we strongly encourage the reader to explore their [work](https://github.com/ethereum/solidity/tree/develop) and [documentation](https://docs.soliditylang.org/en/latest/).

This is **experimental** software, thread with caution.

- - -

### Table of Contents

1.  [New Shielded Types](#1-new-shielded-types)
2.  [Storage Behavior](#2-storage-behavior)
3.  [Restrictions and Caveats](#3-restrictions-and-caveats)
    *   [3.1 No `public` Keyword for Shielded Variables](#31-no-public-keyword-for-shielded-variables)
    *   [3.2 No Shielded Constants or Immutables](#32-no-shielded-constants-or-immutables)
    *   [3.3 Literals and Enums](#33-literals-and-enums)
    *   [3.4 Exponentiation and Gas Costs](#34-exponentiation-and-gas-costs)
    *   [3.5 `.min()` and `.max()` Functions](#35-min-and-max-functions)
    *   [3.6 Events](#36-events)
4.  [Casting and Type Conversion](#4-casting-and-type-conversion)
    *   [4.1 Explicit Casting Required](#41-explicit-casting-required)
    *   [4.2 Casting Addresses to `payable`](#42-casting-addresses-to-payable)
5.  [New Instructions](#5-new-instructions)
    *   [5.1 `CSTORE`](#51-cstore)
    *   [5.2 `CLOAD`](#52-cload)
6.  [Arrays and Collections](#6-arrays-and-collections)
    *   [6.1 Shielded Arrays](#61-shielded-arrays)
    *   [6.2 Limitations](#62-limitations)
    *   [6.3 Mappings](#63-mappings)
7.  [Best Practices](#7-best-practices)
8.  [Conclusion](#8-conclusion)
9.  [Feedback](#9-feedback)

- - -

### 1\. New Shielded Types

We introduce four new types called **shielded types**:

*   **`suint`**: Shielded unsigned integer.
*   **`sint`**: Shielded signed integer.
*   **`saddress`**: Shielded address.
*   **`sbool`**: Shielded bool.

These types function similarly to their unshielded counterparts (`uint`, `int`, `address` and `bool`) but are designed to handle confidential data securely within the smart contract's storage.

#### Usage Example

```
contract ConfidentialWallet {
    suint256 confidentialBalance;
    saddress confidentialOwner;

    constructor(suint256 _initialBalance, saddress _owner) {
        confidentialBalance = _initialBalance;
        confidentialOwner = _owner;
    }

    function addFunds(suint256 amount) private {
        confidentialBalance += amount;
    }

    // Shielded public interface for balance inquiries
    function getConfidentialBalance(saddress caller) public view returns (suint256) {
        require(caller == confidentialOwner, "Unauthorized access");
        return confidentialBalance;
    }

    // Securely transfer funds from this wallet to another shielded address
    function confidentialTransfer(suint256 amount, saddress recipient) public {
        require(msg.sender == confidentialOwner, "Only the owner can transfer");
        require(confidentialBalance >= amount, "Insufficient balance");

        confidentialBalance -= amount;
        // `recipient` would use a shielded receive function to handle incoming funds
        // This line represents a private operation that modifies shielded storage
        // in another confidential contract instance.
        ConfidentialWallet(recipient).addFunds(amount);
    }
}
```


## 2\. Storage Behavior

*   **Whole Slot Consumption**: Shielded types consume an entire storage slot. This design choice ensures that a storage slot is entirely private or public, avoiding mixed storage types within a single slot.

*   **Future Improvements**: We plan to support slot packing for shielded types in future updates. Until then, developers can use inline assembly to achieve slot packing manually if necessary.


#### Assembly Slot Packing Example

```
contract RegularStorage {
    struct RegularStruct {
        uint64 a;   // Slot 0 (packed)
        uint128 b;  // Slot 0 (packed)
        uint64 c;   // Slot 0 (packed)
    }

    RegularStruct regularData;

    /*
       Storage Layout:
       - Slot 0: [a | b | c]
    */
}

contract ShieldedStorage {
    struct ShieldedStruct {
        suint64 a;  // Slot 0
        suint128 b; // Slot 1
        suint64 c;  // Slot 2
    }

    ShieldedStruct shieldedData;

    /*
       Storage Layout:
       - Slot 0: [a]
       - Slot 1: [b]
       - Slot 2: [c]
    */
}
```

## 3\. Restrictions and Caveats

### 3.1 No `public` Keyword for Shielded Variables

*   Shielded variables **cannot** be declared as `public`. This restriction prevents accidental exposure of confidential data.

    `suint256 public confidentialNumber; // This will cause a compilation error`

### 3.2 No Shielded Constants or Immutables

*   Shielded types **cannot** be used as constants or immutables. Constants and Immutables are embedded in the contract bytecode, which is publicly accessible.

    `suint256 constant CONFIDENTIAL_CONSTANT = 42; // Not allowed`


### 3.3 Literals and Enums

*   Be cautious when using literals and enums with shielded types. They can inadvertently leak information if not handled properly.

### 3.4 Exponentiation and Gas Costs

*   Using shielded integers as exponents in exponentiation operations can leak information through gas usage, as gas cost scales with the exponent value.

### 3.5 `.min()` and `.max()` Functions

*   Calling `.min()` and `.max()` on shielded integers can reveal information about their values.

### 3.6 Events

*   Shielded types **cannot** be emitted in events, as this would expose confidential data.

*   **Currently**: Although native event encryption isn'y supported, developers may use the encrypt and decrypt precompiles at addresses 102/103 (see [example](https://github.com/SeismicSystems/seismic-solidity/blob/seismic/test/seismic_example/encrypted_logs.sol)) to secure event data.

*   **Future Improvements**: We plan to support encrypted events, enabling the emission of shielded types without compromising confidentiality or developer experience.

    `event ConfidentialEvent(suint256 confidentialData); // Not allowed`


## 4\. Casting and Type Conversion

### 4.1 Explicit Casting Required

*   Shielded types and their unshielded counterparts do **not** support implicit casting.

```
uint256 publicNumber = 100;
suint256 confidentialNumber = suint256(publicNumber); // Explicit casting required`
```

### 4.2 Casting Addresses to `payable`

*   To cast an `saddress` to a `payable` address, use the following pattern:

```
address payable pay = payable(saddress(SomethingCastableToAnSaddress));`
```


## 5\. New Instructions

We introduce two new EVM instructions to handle confidential storage:

### 5.1 `CSTORE`

*   **Purpose**: Stores shielded values in marked confidential storage slots.
*   **Behavior**: Sets the storage slot as confidential during the store operation.

### 5.2 `CLOAD`

*   **Purpose**: Retrieves shielded values from marked confidential or uninitialized storage slots.
*   **Behavior**: Only accesses storage slots marked as confidential.

### 5.3 Storage Rights Management

*   **Flagged Storage**: We introduce `FlaggedStorage` to tag storage slots as public or private based on the store instructions (`SSTORE` for public, `CSTORE` for confidential).

*   **Access Control**:

    *   **Public Storage**: Can be stored and loaded using `SSTORE` and `SLOAD`.
    *   **Confidential Storage**: Must be stored using `CSTORE` and loaded using `CLOAD`.
*   **Flexibility**: Storage slots are not permanently fixed as public or private. Developers can manage access rights using inline assembly if needed. Otherwise, the compiler will take care of it.


## 6\. Arrays and Collections

### 6.1 Shielded Arrays

*   Arrays of shielded types are supported, and their metadata (e.g., length of a dynamic array) are also stored in confidential storage.

`suint256[] private confidentialDynamicArray;`

*   As such, when interfacing with shielded arrays, we've conserved Solidity rules and just transposed them by using shielded types:

    *    The index should be a Shielded Integer.
    *    The declared length should be a Shielded Integer.
    *    The returned length is a Shielded Integer.
    *    Pushed values should be consistant with the shielded array underlying type.

### 6.2 Limitations

*   Currently, shielded arrays only work with the shielded types (`suint`, `sint`, `saddress` and `sbool`).
*   Shielded `bytes` or `string` arrays are **not yet supported**.
*   It is very likely that some of our intermediary representation is not strictly correct, which would lead into less optimized code as IR is fundamental to optimization passes.

### 6.3 Mappings

*	 Mappings using shielded types for keys and/or values are supported. In such cases, the storage operations will employ the confidential instructions (CLOAD/CSTORE) accordingly.


## 7\. Best Practices

*   **Avoid Public Exposure**: Never expose shielded variables through public getters or events.
*   **Careful with Gas Usage**: Be mindful of operations where gas cost can vary based on shielded values (e.g., loops, exponentiation).
*   **Encrypt Calldata**: Not only must shielded immutable variables be initialized with encrypted calldata, but all functions accepting shielded types should use encrypted calldata.
*   **Manual Slot Packing**: If slot packing is necessary, use inline assembly carefully to avoid introducing vulnerabilities.
*   **Review Compiler Warnings**: Pay attention to compiler warnings related to shielded types to prevent accidental leaks.


## 8\. Conclusion

This extension enhances the EVM by introducing confidential storage capabilities, allowing developers to handle sensitive data securely. By understanding the new shielded types, instructions, and associated caveats, you can leverage these features to build more secure smart contracts.

We encourage you to refer to the standard Ethereum documentation for foundational concepts and use this guide to understand the differences and new functionalities introduced.

We also welcome external contributions to this repository.

## 9\. Upstream

The upstream repository lives [here](https://github.com/ethereum/solidity/tree/develop). This fork is up-to-date with it through commit `322d656`. You can see this by viewing the [develop](https://github.com/SeismicSystems/seismic-solidity/tree/develop) branch on this repository.

You can view all of our changes vs. upstream on this [pull request](https://github.com/SeismicSystems/seismic-solidity/pull/27). The sole purpose of this PR is display our diff; it will never be merged in to the main branch of this repo.

## 9\. Feedback

We welcome your feedback on this documentation. If you have suggestions or encounter any issues, please contact our support team or contribute to our documentation repository.

- - -
