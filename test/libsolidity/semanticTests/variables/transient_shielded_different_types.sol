contract C {
    suint256 transient su;
    sint256 transient si;
    saddress transient sa;
    sbool transient sb;

    function setAndCheckSu(uint256 v) public returns (uint256) {
        su = suint256(v);
        return uint256(su);
    }
    function setAndCheckSi(int256 v) public returns (int256) {
        si = sint256(v);
        return int256(si);
    }
    function setAndCheckSa(address v) public returns (address) {
        sa = saddress(v);
        return address(sa);
    }
    function setAndCheckSb(bool v) public returns (bool) {
        sb = sbool(v);
        return bool(sb);
    }
}
// ====
// EVMVersion: >=cancun
// ----
// setAndCheckSu(uint256): 123 -> 123
// setAndCheckSi(int256): -456 -> -456
// setAndCheckSa(address): 0x1234567890123456789012345678901234567890 -> 0x1234567890123456789012345678901234567890
// setAndCheckSb(bool): true -> true
