contract C {
    sbytes private secret;
    bytes public pub;
    function copyLeak() external { pub = bytes(secret); }
}
// ----
// Warning 10305: (17-38): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10313: (103-116): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
