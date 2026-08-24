pragma abicoder               v2;


// Checks that saddress types are properly cleaned before they are compared.
contract C {
    function f(saddress a) public returns (uint256) {
        if (a != saddress(0x1234567890123456789012345678901234567890)) return 1;
        return 0;
    }

    function g(saddress payable a) public returns (uint256) {
        saddress local = saddress(0x1234567890123456789012345678901234567890);
        if (a != local) return 1;
        return 0;
    }
}
// ----
// f(saddress): 0xffff1234567890123456789012345678901234567890 -> FAILURE
// g(saddress): 0xffff1234567890123456789012345678901234567890 -> FAILURE

