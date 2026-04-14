contract C {
    function eq(saddress a, saddress b) public pure returns (bool) {
        return bool(a == b);
    }
    function neq(saddress a, saddress b) public pure returns (bool) {
        return bool(a != b);
    }
    function eqZero(saddress a) public pure returns (bool) {
        return bool(a == saddress(address(0)));
    }
}
// ----
// eq(saddress,saddress): 0x1234, 0x1234 -> true
// eq(saddress,saddress): 0x1234, 0x5678 -> false
// eq(saddress,saddress): 0x00, 0x00 -> true
// neq(saddress,saddress): 0x1234, 0x1234 -> false
// neq(saddress,saddress): 0x1234, 0x5678 -> true
// neq(saddress,saddress): 0x00, 0x00 -> false
// eqZero(saddress): 0x00 -> true
// eqZero(saddress): 0x1234 -> false
