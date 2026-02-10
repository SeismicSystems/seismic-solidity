# Merge Audit Notes

Details on how the `merge-audits` branch was created by combining the `zellic-audit` and `veridise-audit` branches.

## Branch Topology

Both audit branches forked from the same commit on `seismic`:

```
676bdecc6  (fork point, seismic)
├── zellic-audit   (64 commits, 224 files changed)
└── veridise-audit (72 commits, 233 files changed)
```

No commits were shared between branches (all independent hashes), though ~18 fixes overlapped in scope.

## Merge Strategy

**Order: veridise-audit first, then zellic-audit.**

Veridise was merged first because it introduces a pervasive semantic change: shielded comparisons (`==`, `!=`, `<`, `>`, etc.) now return `sbool` instead of `bool`. This affects many test files. By merging veridise first, git's auto-merge correctly kept veridise's `bool()`-wrapped test assertions when zellic's overlapping test files were merged second.

## Step 1: Merge veridise-audit (0 conflicts)

```bash
git checkout merge-audits
git merge veridise-audit --no-ff
```

This completed cleanly with zero conflicts.

## Step 2: Merge zellic-audit (2 conflicts)

```bash
git merge zellic-audit --no-ff
```

Two files conflicted. Both were resolved manually:

### Conflict 1: `.github/workflows/test.yml`

**Nature:** Both branches changed the CI branch targets — veridise set them to `veridise-audit`, zellic set them to `zellic-audit`.

**Resolution:** Set branch targets to `seismic` and `merge-audits`, removing the temporary audit-branch-specific comments:

```yaml
on:
  push:
    branches:
      - seismic
      - merge-audits
  pull_request:
    branches:
      - seismic
      - merge-audits
```

### Conflict 2: `libsolidity/codegen/YulUtilFunctions.cpp`

**Nature:** Two conflict regions in byte array storage functions. Both branches modified these functions to use `cstore`/`cload` for shielded types instead of hardcoded `sstore`/`sload`, but zellic's version was more thorough.

**Region 1 — `storageArrayPopFunction` (~line 1697):**
- Veridise omitted the `("storeOpcode", ...)` Whiskers template parameter
- Zellic added `("storeOpcode", _type.baseType()->isShielded() ? "cstore" : "sstore")`
- **Took zellic's version** — without this parameter, the `<storeOpcode>` template reference in the function body would be undefined

**Region 2 — `storageArrayPushFunction` (~line 1751):**
- Veridise hardcoded `sstore(array, add(data, 2))`
- Zellic used `<storeOpcode>(array, add(data, 2))`
- **Took zellic's version** — the `<storeOpcode>` template is already parameterized (line 1768: `("storeOpcode", _type.containsShieldedType() ? "cstore" : "sstore")`), so the template reference is correct and handles both shielded and non-shielded cases

## Post-Merge Fix: `libsolidity/ast/Types.h`

The auto-merge produced **duplicate method declarations** for `isShielded()` and `containsShieldedType()` in the `UserDefinedValueType` class. Both branches independently added these declarations but in slightly different positions (veridise placed them before `isValueType()`, zellic placed them after). Git kept both copies, causing a compile error.

**Fix:** Removed the duplicate pair, keeping a single set of declarations after `isValueType()`.

## Auto-Merged Files (no manual intervention)

All other overlapping files were auto-merged correctly by git. Key files verified:

| File | Notes |
|------|-------|
| `libsolidity/codegen/CompilerUtils.cpp` | Zellic's `&&` operator kept (correct). Veridise had `\|\|` which is a tautology. |
| `libsolidity/analysis/TypeChecker.cpp` | Veridise's refactored `checkLiteralToShielded`/`checkShieldedLiteralWarning` helpers coexist with zellic's timestamp gating. |
| `libsolidity/ast/Types.cpp` | Both branches' additions present (veridise's sbool, rational shift/exp; zellic's UDT shielded delegation). |
| Overlapping test files (`shielded_array_cleanup_uint128.sol`, `delete_shielded_storage_array.sol`, etc.) | Veridise's `bool()`-wrapped assertions kept (correct for sbool feature). |

## Verification

All three test suites pass on the merged branch:

| Test Suite | Result |
|---|---|
| `soltest.sh` (Boost C++ unit tests) | 8071 tests passed |
| Semantic tests (no optimizer, `--skip-via-ir`) | 1615 tests passed |
| Semantic tests (optimizer 200 runs, `--skip-via-ir`) | 1615 tests passed |

Note: 48 `compileViaYul: true` tests are skipped because via-IR was intentionally disabled on both audit branches (zellic commit `e4f327d86`, veridise equivalent).

## Comparing Branches on GitHub

To see what each audit contributed uniquely, use GitHub's compare view:

- **What veridise fixed that zellic didn't:** `compare/zellic-audit...merge-audits`
- **What zellic fixed that veridise didn't:** `compare/veridise-audit...merge-audits`
