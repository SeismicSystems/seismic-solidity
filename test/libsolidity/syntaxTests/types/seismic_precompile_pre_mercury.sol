contract C {
    function f() external returns (uint8) {
        return uint8(unsafe_rng_u8());
    }
}
// ====
// EVMVersion: =paris
// ----
// DeclarationError 7576: (78-90): Undeclared identifier.
