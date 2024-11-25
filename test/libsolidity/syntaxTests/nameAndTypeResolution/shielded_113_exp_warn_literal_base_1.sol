contract test {
    function f() pure public returns(uint) {
        suint8 x = 100;
        return uint(10**x);
    }
}
// ----
// DeclarationError 7491: (53-58): Shielded objects cannot be returned, you should cast to an unshielded type.
