contract C {
    enum E { A, B, C }
    suint8 private secret;
    function leak() external view returns (E) {
        return E(secret);
    }
}
// ----
// TypeError 9640: (126-135): Explicit type conversion not allowed from "suint8" to "enum C.E".
// Warning 10313: (126-135): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
