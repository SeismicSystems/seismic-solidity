contract test {
    function f() pure public returns(bool) {
        sbool x = sbool(true);
        return bool(x);
    }
}
// ----
// Warning 9661: (69-90): Bool Literals converted to shielded bools will leak during contract deployment.
