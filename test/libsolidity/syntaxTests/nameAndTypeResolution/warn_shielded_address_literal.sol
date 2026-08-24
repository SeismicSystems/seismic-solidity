contract test {
    function f() pure public returns(address) {
        saddress x = saddress(0xc0ffee254729296a45a3885639AC7E10F9d54979);
        return address(x);
    }
}
// ----
// Warning 10409: (85-137): Address Literals converted to shielded addresses will leak during contract deployment.
// Warning 10313: (154-164): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
