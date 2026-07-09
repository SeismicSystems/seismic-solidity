// Struct with shielded field passed to event — should work if we cast
pragma abicoder v2;
contract C {
    struct S {
        suint256 secret;
        uint256 public_val;
    }
    event DataLogged(uint256 val);
    function f() public {
        S memory s = S(suint256(42), 100);
        emit DataLogged(uint256(s.secret));
    }
}
// ----
// Warning 10403: (264-276): Literals converted to shielded integers will leak during contract deployment.
// Warning 10313: (308-325): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
