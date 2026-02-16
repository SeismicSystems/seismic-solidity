# Merge Audit Summary: veridise-audit + zellic-audit

**Date:** 2026-02-16
**Branch:** `merge-audits-2`
**Base:** `seismic` at `676bdecc6`

## Merge Strategy

Both `veridise-audit` (68 commits, tip `292af6929`) and `zellic-audit` (80 commits, tip `fa6312750`) were forked from the same `seismic` commit (`676bdecc6`). We merged veridise first (clean, 0 conflicts) then zellic second (54 conflicts).

- **Merge commit 1:** `35532baf3` -- Merge veridise-audit into merge-audits-2
- **Merge commit 2:** `30a8e7633` -- Merge zellic-audit into merge-audits-2
- **Total commits on branch:** 159 (78 veridise + 79 zellic + 2 merge commits)

### Why veridise first?

Veridise introduces `sbool` as the return type for shielded comparisons, which permeates test expectations across the codebase. Merging veridise first means all test files already have the correct `sbool` expectations. Veridise also adds several new warnings (9665, 4281-4283, 5765) that add `// Warning` lines to test expectations -- merging it first avoids needing to manually patch zellic's test files.

---

## 1. Merge Conflicts and Resolutions

54 total conflicts: 2 source code files + 51 test files + 1 CI config.

### Source Code Conflicts

#### `.github/workflows/test.yml`
Both branches changed CI trigger branches to their own audit branch name. **Resolution:** Set branch targets to `seismic` and `merge-audits-2`.

#### `libsolidity/codegen/LValue.cpp`
Both branches modified `StorageByteArrayElement` to use shielded opcodes. Zellic additionally added `solAssert` EVM version checks at the entry of each method (`retrieveValue`, `storeValue`, `setToZero`). **Resolution:** Keep veridise's version (which has the functional shielded opcode changes), then add zellic's 3 `solAssert` blocks for defensive EVM version validation.

### Auto-Merged Source Files (verified correct)

These files had DIFFERENT changes on both branches but auto-merged cleanly:

| File | Veridise Changes | Zellic Changes | Outcome |
|------|-----------------|----------------|---------|
| `TypeChecker.cpp` | sbool returns, warnings 4281-4283/5765/9665, `m_insideUncheckedBlock`, `checkMsgValueToShielded`, constant expression leak warnings | EVM version validation block (error 9978), `timestamp_ms`/`timestamp_seconds` gating | Both present, verified |
| `TypeChecker.h` | `visit(Block)`, `endVisit(Block)`, `m_insideUncheckedBlock` counter | No unique changes | Veridise additions present |
| `DeclarationTypeChecker.cpp` | Transient shielded storage rejection (error 9826) | No unique changes | Veridise rejection present |
| `Types.cpp` / `Types.h` | sbool return for comparisons, rational shift/exp shielded types, string literal conversion | No unique changes | Veridise additions present |
| `CompilerUtils.cpp` | No unique changes | `\|\|` to `&&` bug fix in enum conversion guard | Zellic fix present |
| `ExpressionCompiler.cpp` | ShieldedInteger unchecked arithmetic cleanup | No unique changes | Veridise addition present |
| `YulUtilFunctions.cpp` | Shared shielded byte array ops | 4 `solAssert` EVM version guards | Both present |
| `test/CMakeLists.txt` | No unique changes | Added `EVMVersion.cpp` test entry | Zellic addition present |

### Test File Conflicts (51 files)

All resolved by taking veridise's version (`git checkout --ours`).

**Root causes of test differences:**
1. **Warning 9665** (dynamic shielded array length gas-observability): Veridise adds this warning, zellic doesn't. Affects 24+ test files.
2. **Warnings 4281-4283** (shielded arithmetic info leak): Veridise adds these, zellic doesn't. Affects arithmetic test files.
3. **Warning 5765** (shielded type in control flow condition): Veridise adds this, zellic doesn't. Affects parsing test files.
4. **sbool return type**: Veridise changes shielded comparison results from `bool` to `sbool`, shifting expected output in test files.
5. **Rational shift/exp**: Veridise returns shielded types for rational operations with shielded operands, changing expected types in test files.

Since we keep veridise's source code (all warnings + sbool), veridise's test expectations are correct.

**Conflicting test files:**
- `test/libsolidity/syntaxTests/array/shielded_index_*.sol` (7 files)
- `test/libsolidity/syntaxTests/array/shielded_push.sol`
- `test/libsolidity/syntaxTests/array/shielded_dynamic_array_length_*.sol` (2 files)
- `test/libsolidity/syntaxTests/literalOperations/shielded_*_nonliteral.sol` (2 files)
- `test/libsolidity/syntaxTests/literals/shielded_ternary_operator_*.sol`
- `test/libsolidity/syntaxTests/nameAndTypeResolution/shielded_*.sol` (7 files)
- `test/libsolidity/syntaxTests/parsing/shielded_*.sol` (5 files)
- `test/libsolidity/syntaxTests/shieldedTypes/shielded_dynamic_array_length_warning.sol`
- `test/libsolidity/syntaxTests/types/address/saddress_array_*.sol` (6 files)
- `test/libsolidity/syntaxTests/types/sbytes_dynamic_*.sol` (16 files)
- `test/libsolidity/syntaxTests/types/sbytes_operations.sol`

---

## 2. Zellic-Only Features (not in veridise-audit)

These 40 commits are unique to zellic-audit:

### EVM Version Validation & Defaults
- `b35d35863` fix(codegen): add EVM version validation for shielded types
- `4a3962c4b` test(types): add EVM version validation tests for shielded types
- `0fc7ee3a9` fix(langutil): use single source of truth for default EVM version
- `19f5b6279` test(langutil): add EVM version default consistency test

### TIMESTAMPMS / block.timestamp_ms / block.timestamp_seconds
- `3d15507e3` fix: gate TIMESTAMPMS opcode to Mercury-compatible VMs
- `09a15ad5c` test: add EVM version gate test for timestampms instruction
- `dc937a76d` fix: gate block.timestamp_ms and block.timestamp_seconds in TypeChecker
- `9a9374c33` test: expect evm version gating for block.timestamp_ms at the Solidity typechecker level
- `05f3c98c5` fix: --via-ir pipeline should support magic block.timestamp_ms and .timestamp_seconds
- `99ae5ec79` test: add yul, syntax & semantic tests for timestamp_seconds/timestamp_ms
- `bc3436634` fix(yul): add timestampms to reserved identifier exceptions for pre-Mercury
- `62bccfa6b` test(yul): add tests for timestampms identifier reservation

### SMT / Formal Verification
- `59a419562` fix: alias block.timestamp_seconds to block.timestamp in SMT model
- `a6dc90071` test: add SMT test for block.timestamp_seconds aliasing bug

### Yul Optimizer: cstore/cload Canonical Storage
- `fa6312750` fix(yul-optimizer): wire cstore/cload as canonical storage in libyul
- `a24f7addd` test(yul-optimizer): add cstore/cload optimizer tests

### CSE Cross-Domain Fix
- `88bb1dc26` Fix: CSE applies across confidential domain to remove sload from a private slot (#111)
- `15ddfef81` Failing tests: CSE applies across confidential domain to remove sload from a private slot (#110)

### Shielded UDT (User-Defined Type) Codegen
- `5fbd4d4bb` fix(codegen): support shielded primitives in user-defined types
- `473efad36` test(codegen): add tests for UDT wrapping shielded primitives

### Struct Delete with Mixed Shielded Fields
- `f6e0052d5` fix(codegen): use sstore for sub-32-byte fields in struct delete clear
- `1199286bb` test(codegen): add regression tests for struct delete with mixed shielded fields

### Enum Conversion Guard Bug Fix
- `6847fe78a` fix(codegen): correct enum conversion guard for address/saddress types
- `3a3fbf98e` test(codegen): add regression tests for address/saddress to enum conversion

### Other Zellic-Only Fixes
- `a67141339` fix(codegen): incorrect store/load instruction when copying shielded bytes (#176)
- `5c7547612` fix: GenericStorageItem::setToZero should check all shielded types (#116)
- `4e35d3425` fix: ArrayUtils::clearArray should use CSTORE for shielded arrays
- `1ef32a128` test: add failing test for shielded array deletion
- `8cea3d16b` fix: --via-ir pipeline should support ShieldedFixedBytes (#125)
- `44c01f2bc` fix(tstore): transient s-types should use tstore/tload (#124)
- `bca3310f3` Fix: in UnusedStorageEliminator, CSTORE is indeed a valid storage write (#108)

### Zellic-Only Test Updates
- `b9d98678e` test(analysis): add regression tests for mismatched privacy opcodes
- `959c4a3e4` test(codegen): add regression tests for bytes/string push bug
- `bf5a8b81b` delete cstore->cload sem test (is now syntax test)
- `c55e60eec` test: update sstore then cload test expectations to reflect new semantics in revm

### Zellic CI Improvements
- `8a3cecaef` ci(speedup): only reconfigure cmake if something has changed (#143)
- `8a2c39047` ci(speedup): cache more steps in the solidity build (#140)
- `6c84c4a17` ci: remove double apt-get; print ccache stats (#145)
- `2fca444c8` ci: don't run CI on PRs to seismic branch in the zellic-audit branch
- `7667afcfb` CI (zellic-audit): run semantic tests with optimizer on for 200 runs as well (#103)

---

## 3. Veridise-Only Features (not in zellic-audit)

These 39 commits are unique to veridise-audit:

### sbool for Shielded Comparisons
- `ea660cd03` fix(types): return sbool for shielded type comparisons
- `b11374a5c` test(types): add tests for shielded type comparisons returning sbool

### Shielded Transient Storage Rejection
- `72ef8838e` fix(analysis): reject shielded types with transient storage
- `75e8903ac` test(analysis): expect shielded transient storage rejection
- `0f6b1d13d` fix(codegen): use TSTORE/TLOAD for transient shielded value types (dead code -- blocked by type checker rejection)
- `756263449` test(codegen): add tests for transient shielded storage opcodes

### Control Flow Condition Warnings (5765)
- `d09113646` fix(analysis): warn about shielded types in control flow conditions
- `2e255bfb9` test(analysis): add syntax tests for shielded control flow warnings

### Arithmetic Info Leak Warnings (4281/4282/4283)
- `35d3929d2` fix(analysis): warn about shielded integer arithmetic info leaks
- `488dff1dc` test(analysis): add syntax tests for shielded arithmetic info leaks
- `83f6b84ae` fix(codegen): include ShieldedInteger in unchecked arithmetic cleanup
- `4b9c6d4b2` test(codegen): add tests for shielded integer cleanup in unchecked mode

### msg.value to Shielded Type Warning
- `a3fa2862e` fix(analysis): warn when msg.value is assigned to shielded type
- `09840203c` test(analysis): expect msg.value to shielded type warning

### Constant Expression Leak Warnings
- `11971ecb4` fix(analysis): warn on constant expressions cast to shielded types
- `7d0b91ff2` test(analysis): expect shielded leak warnings for constant exprs

### Dynamic Array Length Warning (9665)
- `a67111025` fix(analysis): warn about dynamic shielded array length upper-bound
- `cbeb74384` test(analysis): expect dynamic shielded array length upper-bound warning

### Rational Shift/Exp Shielded Return Types
- `c6dc6aad5` fix(types): return shielded types for rational shift/exp with shielded operand
- `a792c66fe` test(types): add tests for shielded rational shift and exp result types

### Shielded UDVT Mapping Key Rejection
- `ee520ff9e` fix(types): reject shielded UDVTs as mapping keys

### String Literal to sbytesN Rejection
- `469a0c1cf` fix(types): reject implicit string literal conversion to sbytesN
- `48c11bf53` test(analysis): add syntax tests for implicit string literal to sbytesN

### Array Literal Shielded Detection
- `4690875d2` fix(analysis): detect shielded literals in array literal initializers
- `96d705fc4` test(analysis): add tests for shielded literal array warnings

### KnownState Revert Fix (VER-762)
- `d9f79f54e` Fix Ver[762]: KnownStorage may drop revert (#97)
- `40f634b92` Test Ver[762]: add KnownStorage tests that should fail with the optimizer enabled (#98)

### Comprehensive Literal-to-Shielded Warning Detection
- `0e2c342b1` fix: comprehensive literal-to-shielded warning detection
- `1a0822614` test: add comprehensive tests for literal-to-shielded warnings

### Other Veridise-Only Changes
- `4c6708f7c` fix: use CSTORE for all shielded delete operations
- `49a23304a` test: add comprehensive tests for shielded delete operations
- `fdd788d03` test: we're now allowed to cload from public storage
- `e8a7e4d20` test(semantic): update the storage tests to reflect new semantics
- `eec6ccb7a` docs(shielded): add SHIELDED_TYPES.md documenting privacy edge cases
- `f27b8fbec` chore(types): document isByteArrayOrString non-shielded assumption
- `b52b98e84` ci(cache): run github actions with smarter cache so builds go faster
- `a66067d3c` Optimizer bug: in UnusedStorageEliminator, CSTORE is indeed a storage write (#101)
- `d727d3c33` CI: run semantic tests with optimizer on for 200 runs as well (#99)
- `1d571aa7c` ci: don't run CI on PRs to seismic branch for now (#147)

---

## 4. Common Fixes (present on both branches)

39 commits were made independently on both branches (same fix, different commit hashes). The veridise hash is listed first, zellic hash second.

### via-IR Pipeline Support
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `292af6929` | `4a228e7c4` | fix(via-ir): complete shielded type support for via-IR pipeline |
| `268086b57` | `46942cffb` | test(via-ir): add regression tests with compileViaYul:also |
| `b2a0417ad` | `a2480c216` | test(via-ir): update test configuration for via-IR compatibility |
| `1e2189e96` | `848e6112c` | ci(semantic-tests): add via-IR test runs with --unsafe-via-ir |
| `a5f4047c1` | `e4f327d86` | chore(ir): disable compiling with --via-ir pipeline until we fully support it |
| `c7ba41a0b` | `fe61bfe25` | ci(ir): use --skip-via-ir for semantic tests until via-ir is re-enabled |
| `6f3e91419` | `70b588d9f` | test(ir): disable tests that require --via-ir |

### sbytes Dynamic Shielded Byte Array Support
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `f90549070` | `539276659` | docs(types): document sbytes dynamic shielded bytes support |
| `452325516` | `040d93df0` | fix(codegen): implement sbytes and fix cstore/cload codegen bugs |
| `503a9607e` | `9fd78c5a7` | test(types): add sbytes dynamic shielded byte array tests |
| `580a46d5a` | `4510920a4` | test(types): update existing tests for sbytes dynamic byte array |

### Shielded Storage Opcodes
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `38a7e6ca7` | `7e6593e9b` | fix(codegen): complete shielded storage opcode fixes for VER-771 |
| `e49c82731` | `5354fc508` | test(codegen): add regression tests for shielded storage bugs |
| `8f80457cd` | `85f62ae9d` | fix: use cstore/cload for shielded array storage operations |
| `0912dbbfd` | `f85a66a95` | test: add regression tests for shielded array storage operations |
| `87803500b` | `80b21a5be` | fix(types): use cload/cstore for dynamic shielded array length |
| `d28f4a558` | `fa9ee13b4` | test(types): expect suint length for dynamic shielded arrays |
| `61c27e947` | `ad883e156` | feat(analysis): add shielded storage opcode semantics to type-checker (#136) |

### Optimizer Fixes
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `a3f428754` | `5f21e45a7` | fix(evmasm-optimiser): mark sload as having effects (#148) |
| `bbf49fa00` | `798e2fd94` | fix(yul-optimiser): dont hoist sloads since they can revert (#151) |
| `912770881` | `8fb3c2ab9` | fix(optimiser): cstore shouldn't be eliminated when followed by sstore (#112) |

### GasMeter
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `c86f222e0` | `9165989d3` | Fix: GasMeter should handle CLOAD/CSTORE operations (#104) |
| `21372ec54` | `dd83ecc72` | Test: GasMeter should know CLOAD/CSTORE's fix gas costs (#109) |

### ABI Encoding Rejection
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `77c871e8c` | `3c9014018` | fix(analysis): reject shielded types in ABI encoding and decoding |
| `a12f2c055` | `5bde633e3` | test(analysis): add syntax tests for shielded types in ABI encoding |

### Shielded Literal Warnings
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `bc727132d` | `41c923702` | fix(analysis): warn on shielded literal conversions in all contexts |
| `9020bc2d4` | `4b3ab630c` | test(analysis): expect shielded literal leak warnings in non-declaration contexts |

### Type Restrictions & Conversions
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `b9668c655` | `7d5cccc07` | fix(types): restrict saddress members to code and codehash only |
| `d136c7fcd` | `37d3bd75e` | test(types): add tests for disallowed saddress member access |
| `231dc55ff` | `12b94de99` | fix: `saddress[]` should not be implicitly convertible to `address[]` (#118) |
| `f020e1f1a` | `4cfbda563` | test: update tests that check disallowing implicit conversion of saddress <=> address |
| `30b645096` | `0c8d7a264` | fix(codegen): support string literal to ShieldedFixedBytes conversion |
| `6396e2739` | `5bc3ba70e` | test(codegen): add tests for string literal to sbytes conversion |
| `f94ad1de6` | `545ed832b` | fix(codegen): check base type instead of array category for shielded opcode selection |
| `dac7f6845` | `491cec472` | test(codegen): add syntax test for byte array helpers with non-shielded types |
| `9b784db01` | `d4ca18569` | test(types): add regression tests for UDVT shielded mapping keys |

### Visibility Restrictions
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `a00661d77` | `fd48956dd` | fix(visibility): prevent returning any shielded type in public/external fcts |
| `2ca6dd693` | `6c1bb1a53` | test: add tests for shielded types return visibility |

### Test Fixes
| Veridise | Zellic | Description |
|----------|--------|-------------|
| `a3d8da88d` | `b30f6b5b9` | test: fix semantic tests |

---

## Design Decision: Transient Shielded Storage

Veridise rejects shielded types with the `transient` storage qualifier (error 9826 in `DeclarationTypeChecker.cpp`). Zellic supports it by routing through TSTORE/TLOAD in `LValue.cpp`. **We chose veridise's rejection** as the safer default. Zellic's TSTORE/TLOAD codegen paths are still in the codebase but are dead code -- the type checker prevents them from being reached. This can be relaxed in the future by removing the error 9826 check.

## How to Compare Branches

```bash
# What veridise fixed that zellic didn't:
git diff zellic-audit..merge-audits-2

# What zellic fixed that veridise didn't:
git diff veridise-audit..merge-audits-2
```
