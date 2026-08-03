# Seismic Solidity (ssolc)

Fork of the [Ethereum Solidity compiler](https://github.com/ethereum/solidity) that adds **confidential storage** to the EVM, enabling smart contracts to handle sensitive data privately on-chain. Upstream is tracked through the `develop` branch.

**Workspace context**: this repo is part of the multi-repo Seismic workspace. If the workspace file isn't already in your context, read `../CLAUDE.md` (sibling checkout) or fetch [CLAUDE.workspace.md](https://github.com/SeismicSystems/seismic/blob/main/workspace/CLAUDE.workspace.md) (standalone checkout/CI) for key concepts, the repo map, and cross-repo conventions.

## What This Does

Standard EVM storage is publicly readable by anyone. Seismic extends the compiler with four **shielded types** — `suint`, `sint`, `saddress`, `sbool` — that behave like their normal counterparts but store data in confidential storage slots. The compiler automatically emits `CSTORE`/`CLOAD` opcodes (instead of `SSTORE`/`SLOAD`) for shielded variables, so developers write familiar Solidity while getting privacy guarantees at the storage layer. Shielded types each occupy a full storage slot (no packing), cannot be `public`/`constant`/`immutable`, and cannot appear in events. Shielded arrays and mappings with shielded values are supported; shielded types as mapping keys or array indices are disallowed.

## Contributing

- **Pull requests** must target [`SeismicSystems/seismic-solidity`](https://github.com/SeismicSystems/seismic-solidity) against the `seismic` branch (the default branch) unless otherwise specified.
- Do not open PRs against `develop` (that tracks upstream Ethereum Solidity) or any other branch without explicit instruction.
- Do not open pull requests that only fix typos — they will be closed.

## Build

C++ project using CMake. The output binary is `build/solc/solc` (branded as `ssolc`).

### macOS (arm64/x86_64)

```bash
# Dependencies
brew install cmake boost

# Build
mkdir -p build && cd build
cmake ..
make -j$(sysctl -n hw.ncpu)
```

### Linux (Ubuntu)

```bash
# Dependencies
sudo apt-get update
sudo apt-get install -y build-essential cmake python3 zlib1g-dev libboost-all-dev libssl-dev

# Build
mkdir -p build && cd build
cmake ..
make -j$(nproc)
```

### Verify

```bash
build/solc/solc --version
# Expected: ssolc, the seismic solidity compiler commandline interface
# Version: 0.8.31-develop...
```

## Test

### Unit tests (soltest)

Runs Boost C++ unit tests (excludes semantic tests by default).

```bash
./scripts/soltest.sh
```

Filter to specific tests:

```bash
./scripts/soltest.sh -t 'syntaxTests/viewPureChecker/*'
```

### Semantic tests (requires seismic-revm)

Semantic tests run via `revme` from [seismic-revm](https://github.com/SeismicSystems/seismic-revm). Semantic test commands must be run from within the seismic-revm repo. All Seismic repos live as siblings under a shared workspace directory (see the workspace CLAUDE.md one level up for the full layout). Replace `<solidity-repo-root>` with the absolute path to your seismic-solidity checkout (e.g. for git worktrees, use the worktree path) and `<seismic-revm-repo-root>` with the absolute path to your seismic-revm checkout.

All configurations use `--unsafe-via-ir` to bypass a compile-time restriction — this does not force all tests through the via-IR pipeline.

**Without optimizer, without --via-ir:**

```bash
cd <seismic-revm-repo-root> && cargo run -p revme -- semantics \
  --keep-going --unsafe-via-ir \
  -s "<solidity-repo-root>/build/solc/solc" \
  -t "<solidity-repo-root>/test/libsolidity/semanticTests"
```

**With optimizer, without --via-ir:**

```bash
cd <seismic-revm-repo-root> && cargo run -p revme -- semantics \
  --keep-going --unsafe-via-ir \
  --optimize --optimizer-runs 200 \
  -s "<solidity-repo-root>/build/solc/solc" \
  -t "<solidity-repo-root>/test/libsolidity/semanticTests"
```

**Without optimizer, with --via-ir:**

```bash
cd <seismic-revm-repo-root> && cargo run -p revme -- semantics \
  --keep-going --unsafe-via-ir --via-ir \
  -s "<solidity-repo-root>/build/solc/solc" \
  -t "<solidity-repo-root>/test/libsolidity/semanticTests"
```

**With optimizer, with --via-ir:**

```bash
cd <seismic-revm-repo-root> && cargo run -p revme -- semantics \
  --keep-going --unsafe-via-ir --via-ir \
  --optimize --optimizer-runs 200 \
  -s "<solidity-repo-root>/build/solc/solc" \
  -t "<solidity-repo-root>/test/libsolidity/semanticTests"
```

Some tests may only fail with the optimizer enabled or disabled. Test both configurations when debugging issues.

### Interactive test expectation tool (isoltest)

`isoltest` manages syntax/analysis test expectations. Build it from the build directory:

```bash
cd build && make -j$(nproc) isoltest
```

**Always** pass `--no-semantic-tests` — semantic tests are run via `revme`, not isoltest.

```bash
# Run specific test(s)
build/test/tools/isoltest --no-semantic-tests -t "syntaxTests/types/shielded_*"

# Run all syntax tests
build/test/tools/isoltest --no-semantic-tests -t "syntaxTests/*"
```

`--accept-updates` can batch-fix test expectations, but **never run it without explicit approval** — it silently rewrites every failing test's expected output, which can mask regressions. Always review changes via `git diff` afterward.

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

## Seismic Error Codes

Seismic-specific error codes (errors and warnings) use **5-digit IDs in the 10000+ range**. Upstream Solidity codes are 4-digit (1000–9999). This separation is critical — the `--no-seismic-warnings` CLI flag suppresses all warnings with IDs >= 10000, so if a Seismic-specific warning is accidentally assigned a 4-digit code, it will not be suppressible.

When adding a new error or warning:
- **Always use a 5-digit code >= 10000** for anything Seismic-specific.
- **Never use a code < 10000** for Seismic functionality — those are reserved for upstream Solidity.
- Pick the code from the appropriate group below based on the 3rd digit (`10XYZ`, where `X` is the group).

### Code groups (`10X__`)

| Group | Range | Category | Description |
|-------|-------|----------|-------------|
| `100__` | 10001–10099 | EVM compatibility | Mercury EVM version requirements — shielded types needing Mercury, `cload`/`cstore`/`timestampms` opcodes, `timestamp_ms`/`timestamp_seconds` members |
| `101__` | 10100–10199 | Declaration constraints | Restrictions on where shielded types can appear — no `public` state vars, no return from public/external functions, no `constant`/`immutable`, no transient storage, no mapping keys, no array indices, no event params, address payable restrictions, EOF compatibility |
| `102__` | 10200–10299 | ABI encoding & type interaction | ABI encoding prohibition for shielded types, `new` with `saddress`, array push type mismatches, unit denomination restrictions, `saddress` member access |
| `103__` | 10300–10399 | Information leak warnings | Runtime privacy warnings — comparison/arithmetic leaks, exponentiation gas leaks, dynamic array length observability, `msg.value`/`msg.data` visibility, branching on `sbool`, `sstore`/`cstore` slot conflicts |
| `104__` | 10400–10499 | Deployment leak warnings | Literal and constant conversion warnings — literals (int, bool, address, fixedbytes, enum) converted to shielded types leak during deployment, shielded number literal (`s` suffix) leaks |

### Adding a new code

1. Identify which group the error belongs to.
2. Pick the next unused number within that group.
3. If none of the existing groups fit, use the next available group digit (e.g., `105__`).
4. Run `scripts/error_codes.py --check` to verify no duplicates.

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
| Semantic tests skipped by `soltest.sh`                                           | By design — `soltest.sh` passes `--no-semantic-tests`. Semantic tests require `seismic-revm`'s `revme` binary.                              |
| Build very slow on macOS with `-j $(sysctl -n hw.ncpu)`                          | CI uses `-j 2` for macOS. Try fewer jobs if memory-constrained.                                                                             |
| `PEDANTIC=ON` causes build warnings-as-errors                                    | Use `-DPEDANTIC=OFF` for local development.                                                                                                 |
