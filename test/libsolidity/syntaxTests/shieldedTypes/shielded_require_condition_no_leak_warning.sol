contract C {
    sbool private flag;
    sbytes private secret;

    // require condition is control flow, not returndata -> no 10313.
    function checkOnly() external view {
        require(bool(flag));
    }

    // require/revert message IS returndata -> must still warn 10313.
    function leakMessage(bool cond) external view {
        require(cond, string(bytes(secret)));
    }
    function leakRevertString() external view {
        revert(string(bytes(secret)));
    }
}
// ----
// Warning 10305: (41-62): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10313: (363-376): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (456-469): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
