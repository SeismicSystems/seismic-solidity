contract test {
    function f() pure public returns(bool) {
        sbool x = sbool(true);
        return bool(x);
    }
}
// ----
// Warning 10406: (79-90): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10313: (107-114): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
