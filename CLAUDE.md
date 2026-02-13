# Seismic Solidity (ssolc)

Fork of the [Ethereum Solidity compiler](https://github.com/ethereum/solidity) that adds **confidential storage** to the EVM, enabling smart contracts to handle sensitive data privately on-chain. Upstream is tracked through the `develop` branch.

## What This Does

Standard EVM storage is publicly readable by anyone. Seismic extends the compiler with four **shielded types** — `suint`, `sint`, `saddress`, `sbool` — that behave like their normal counterparts but store data in confidential storage slots. The compiler automatically emits `CSTORE`/`CLOAD` opcodes (instead of `SSTORE`/`SLOAD`) for shielded variables, so developers write familiar Solidity while getting privacy guarantees at the storage layer. Shielded types each occupy a full storage slot (no packing), cannot be `public`/`constant`/`immutable`, and cannot appear in events. Shielded arrays and mappings with shielded values are supported; shielded types as mapping keys or array indices are disallowed.

## Build

C++ project using CMake. The output binary is `build/solc/solc` (branded as `ssolc`).

### macOS (arm64/x86_64)

```bash
# Dependencies
brew install cmake boost

# Build (Debug, no pedantic warnings)
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DPEDANTIC=OFF
cmake --build . --config Debug -j $(sysctl -n hw.ncpu)
```

### Linux (Ubuntu)

```bash
# Dependencies
sudo apt-get update
sudo apt-get install -y build-essential cmake python3 zlib1g-dev libboost-all-dev libssl-dev

# Build
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DPEDANTIC=OFF
cmake --build . --config Debug -j $(nproc)
```

### Verify

```bash
build/solc/solc --version
# Expected: ssolc, the seismic solidity compiler commandline interface
# Version: 0.8.31-develop...
```

## Test

### Unit tests (soltest)

Runs 7969 Boost test cases. Excludes semantic tests by default.

```bash
./scripts/soltest.sh
```

Filter to specific tests:

```bash
./scripts/soltest.sh -t 'syntaxTests/viewPureChecker/*'
```

### Semantic tests (requires seismic-revm)

Semantic tests run via `revme` from [seismic-revm](https://github.com/SeismicSystems/seismic-revm). CI clones and builds it automatically. To run locally:

```bash
git clone https://github.com/SeismicSystems/seismic-revm.git /tmp/seismic-revm
cd /tmp/seismic-revm && cargo build -p revme
SEISMIC_REVME_EXEC=/tmp/seismic-revm/target/debug/revme
SSOLC_EXEC=$(pwd)/build/solc/solc

$SEISMIC_REVME_EXEC semantics --keep-going -s "$SSOLC_EXEC" -t test/libsolidity/semanticTests
```

### Quick compile check

```bash
echo 'pragma solidity ^0.8.0; contract T { suint256 private x; }' | build/solc/solc --bin -
```

## Project Layout

```
solc/                  CLI entry point (CommandLineInterface, CommandLineParser)
libsolidity/
  ast/                 AST nodes and type system (Types.h/cpp = shielded type classes)
  analysis/            Semantic analysis (TypeChecker, ViewPureChecker, DeclarationTypeChecker)
  parsing/             Lexer/parser
  codegen/             Legacy codegen + IR codegen (YulUtilFunctions has cstore/cload logic)
  codegen/ir/          Yul IR generator (IRGeneratorForStatements handles shielded types)
  interface/           Compiler interface and standard JSON
  lsp/                 Language server protocol support
  formal/              SMT-based formal verification
libyul/                Yul intermediate language (AST, optimizer, EVM backend)
libevmasm/             Low-level EVM assembly and bytecode optimization
liblangutil/           Tokens (Token.h defines suint/sint/saddress/sbool keywords), scanner, errors
libsolutil/            General utilities (hashing, JSON, string ops)
libsmtutil/            SMT solver interface (Z3, CVC4)
libsolc/               C API for embedding
libstdlib/             Standard library stubs
deps/                  Vendored: fmtlib, nlohmann-json, range-v3
test/
  libsolidity/
    syntaxTests/       ~3700 expectation-based .sol files (including ~200 shielded-type tests)
    semanticTests/     ~1700 .sol files (run via seismic-revm, not soltest)
  seismic_example/     Example contracts (encrypted_logs.sol)
tools/yulPhaser/       Genetic algorithm optimizer for Yul
scripts/               Build, test, and CI scripts
```

## Key Seismic Modifications

Shielded types are woven through the full compilation pipeline:

- **Tokens**: `liblangutil/Token.h` — keywords `suint`, `sint`, `saddress`, `sbool`
- **Type system**: `libsolidity/ast/Types.h` — `ShieldedIntegerType`, `ShieldedAddressType`, `ShieldedBoolType`
- **Type provider**: `libsolidity/ast/TypeProvider.h` — factory methods for shielded types
- **Storage codegen**: `libsolidity/codegen/YulUtilFunctions.cpp` — `cstore`/`cload` replace `sstore`/`sload`
- **IR generation**: `libsolidity/codegen/ir/IRGeneratorForStatements.cpp` — shielded expression handling
- **Type checking**: `libsolidity/analysis/TypeChecker.cpp` — validation rules (no public shielded vars, no shielded constants/immutables, no shielded event params, no shielded mapping keys, no shielded array indices)

## Code Style

See `CODING_STYLE.md`. Key rules:

- **Tabs** for indentation in C++ (4-char tab stops), spaces in .sol/.yul (4 spaces)
- **camelCase** everywhere; types/enums/template params start uppercase
- `_paramName` prefix for function parameters; `m_` for private fields
- `solAssert` for internal invariant checks
- Max 99 chars per line
- Include order: project-specific → boost → STL (with blank lines between groups)
- `#pragma once` (no include guards)

## CI

GitHub Actions (`.github/workflows/`):

- **test.yml**: Builds Debug on Linux, runs `soltest.sh` and semantic tests via seismic-revm
- **release.yml**: Builds Release on Linux (ubuntu-latest, ubuntu-22.04), macOS (arm64 + x86_64), and Windows. Produces `ssolc-*` tarballs/zips.

## Branches

- `seismic` — main branch (PR target)
- `develop` — upstream Solidity tracking branch

## Troubleshooting

| Problem                                                                          | Fix                                                                                                                                         |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `ld: warning: object file ... was built for newer 'macOS' version`               | Harmless linker warning from Boost on macOS. Safe to ignore.                                                                                |
| `cmake` can't find Boost                                                         | On macOS: `brew install boost`. On Linux: `sudo apt-get install libboost-all-dev`.                                                          |
| 7 test failures in `syntaxTests` re: Warning 9328 (`block.timestamp` randomness) | Known issue from `e25f9a2cb` commit. Test expectation files need updating to include the new warning. Does not affect compiler correctness. |
| Semantic tests skipped by `soltest.sh`                                           | By design — `soltest.sh` passes `--no-semantic-tests`. Semantic tests require `seismic-revm`'s `revme` binary.                              |
| Build very slow on macOS with `-j $(sysctl -n hw.ncpu)`                          | CI uses `-j 2` for macOS. Try fewer jobs if memory-constrained.                                                                             |
| `PEDANTIC=ON` causes build warnings-as-errors                                    | Use `-DPEDANTIC=OFF` for local development.                                                                                                 |
