contract test {
    function f() pure public returns(address) {
        saddress x = saddress(0xc0ffee254729296a45a3885639AC7E10F9d54979);
        return address(x);
    }
}
// ----
// Warning 10409: (85-137): Address Literals converted to shielded addresses will leak during contract deployment.
