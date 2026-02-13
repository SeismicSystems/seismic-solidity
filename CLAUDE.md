# CLAUDE.md — seismic-solidity

## Project Overview

Fork of the Solidity compiler (v0.8.31) extending the EVM with **confidential storage** via shielded types (`suint`, `sint`, `saddress`, `sbool`). Introduces `CSTORE`/`CLOAD` instructions that use confidential storage instead of public `SSTORE`/`SLOAD`.

**Primary branch:** `seismic` (not `main` or `develop`)
**Upstream tracking:** `develop` tracks `ethereum/solidity`

## Build

**CMake minimum:** 3.13.0
**Output binary:** `build/solc/solc` (the `ssolc` compiler)

### macOS

```bash
# Install dependencies
brew install cmake boost ccache
brew link boost   # required — boost may be installed but unlinked

# Build
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DPEDANTIC=OFF \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache
cmake --build . --config Debug -j $(sysctl -n hw.ncpu)
```

**Note:** Linker warnings about Boost being "built for newer macOS version" are harmless and can be ignored.

### Linux (Ubuntu/Debian)

```bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y build-essential cmake python3 libboost-all-dev libssl-dev zlib1g-dev ccache

# Build
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DPEDANTIC=OFF \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache
cmake --build . --config Debug -j $(nproc)
```

## Testing

### Compiler tests (isoltest)

```bash
./scripts/isoltest.sh    # interactive test updater
./scripts/soltest.sh     # non-interactive test runner
```

### Semantic tests (requires seismic-revm)

```bash
# Build revme first from https://github.com/SeismicSystems/seismic-revm
RUST_LOG=info RUST_BACKTRACE=1 revme semantics \
  --keep-going -s build/solc/solc \
  -t test/libsolidity/semanticTests
```

### Command-line tests

```bash
./test/cmdlineTests.sh
```

**Key test locations:**

- `test/libsolidity/semanticTests/` — semantic tests including shielded types
- `test/cmdlineTests/` — 648+ CLI test cases
- `test/seismic_example/` — example Seismic contracts
- `test/libsolidity/semanticTests/functionCall/seismic_precompiles/` — precompile tests (AES, RNG, Secp256k1)

## C++ Code Style (from CODING_STYLE.md)

**GOLDEN RULE:** Follow the style of existing code.

### Formatting

- **Indentation:** Tabs (4-char stops), never spaces for leading indent
- **Line width:** Max 99 characters
- **Braces:** Allman style — always on their own line, same indentation as parent
- **Single-statement blocks:** No braces unless needed for clarity
- **Condition bodies:** Never on same line as condition

### Naming

- **Preprocessor:** `ALL_CAPS_WITH_UNDERSCORES`
- **Types, enums, templates:** `CapitalizedCamelCase`
- **Functions, variables:** `camelCase`
- **Function parameters:** Leading `_` (e.g., `_paramName`)
- **Output params:** `o_paramName`; input/output: `io_paramName`
- **Private members:** `m_` prefix (not in structs)
- **Globals (non-const):** `g_` prefix
- **Static (non-const):** `s_` prefix

### Includes (order matters)

1. Corresponding `.h` file first
2. `libsolidity` headers
3. `libevmasm` headers
4. `libsolutil` headers
5. `boost` headers
6. STL headers

Blank line between each group.

### Key Practices

- `#pragma once` (no include guards)
- `using` over `typedef`
- `enum class` over plain `enum`
- Prefer enums over bools for function parameters
- Use `solAssert` and `solUnimplementedAssert` generously
- Pass non-trivial params as `const&`
- Use `std::optional` over raw pointers where possible
- Only use `auto` if the type is very long and irrelevant
- Doxygen: `@notation` not `\notation`
- No `using namespace` in headers

## Architecture

```
libsolidity/     — Core compiler (AST, analysis, codegen, parsing, LSP, formal verification)
libevmasm/       — EVM assembly generation
liblangutil/     — Language utilities, diagnostics, source locations
libsmtutil/      — SMT solver integration
libsolutil/      — Common utilities
libstdlib/       — Standard library
libyul/          — Yul intermediate representation and optimizer
solc/            — Compiler CLI (main.cpp, CommandLineInterface.cpp)
```

## Seismic-Specific Concepts

- **Shielded types:** `suint8`–`suint256`, `sint8`–`sint256`, `saddress`, `sbool`
- **Confidential storage:** Shielded types use `CSTORE`/`CLOAD` (not `SSTORE`/`SLOAD`)
- **Whole-slot consumption:** Each shielded variable occupies a full storage slot
- **No `public` keyword** on shielded state variables (no auto-generated getters)
- **No `constant`/`immutable`** for shielded types
- **Explicit casting required** between shielded and unshielded types
- **Shielded arrays:** `.length` returns `uint` (not `suint`); constructor length param is `uint`
- **Shielded mappings:** Supported with shielded value types
- **Precompiles:** AES encrypt/decrypt (0x66/0x67), RNG (0x64), key derivation, Secp256k1 signing

## CI/CD

- **GitHub Actions** (`test.yml`): builds ssolc, runs soltest + semantic tests on `seismic` branch
- **CircleCI** (`.circleci/config.yml`): upstream Solidity CI configuration
- Runs on `xl-github-runner` with 120-minute timeout
- Uses ccache for incremental builds
- Semantic tests require `seismic-revm` (cloned and built in CI)

## Troubleshooting

| Problem                                 | Fix                                                         |
| --------------------------------------- | ----------------------------------------------------------- |
| `FindBoost.cmake` not found (macOS)     | `brew install boost && brew link boost`                     |
| `nproc: command not found` (macOS)      | Use `$(sysctl -n hw.ncpu)` instead of `$(nproc)`            |
| `isoltest.sh` fails with "No such file" | Build hasn't completed — run the full build first           |
| Git submodules not initialized          | CMake auto-inits them, or run `git submodule update --init` |

## Commit Conventions

- Format: `feat: description (#PR)`, `fix: description (#PR)`, `CI: description (#PR)`
- PRs target the `seismic` branch
- Ensure both compiler tests and semantic tests pass before merging
