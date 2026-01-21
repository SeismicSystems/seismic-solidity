contract C {
    suint256 transient su;
    sint256 transient si;
    saddress transient sa;
    sbool transient sb;

    function setSu(suint256 v) public {
        su = v;
    }
    function setSi(sint256 v) public {
        si = v;
    }
    function setSa(saddress v) public {
        sa = v;
    }
    function setSb(sbool v) public {
        sb = v;
    }

    function checkSu() public view returns (uint256) {
        return uint256(su);
    }
    function checkSi() public view returns (int256) {
        return int256(si);
    }
    function checkSa() public view returns (address) {
        return address(sa);
    }
    function checkSb() public view returns (bool) {
        return bool(sb);
    }
}
// ====
// EVMVersion: >=cancun
// ----
// setSu(uint256): 123 ->
// checkSu() -> 123
// setSi(int256): -456 ->
// checkSi() -> -456
// setSa(address): 0x1234567890123456789012345678901234567890 ->
// checkSa() -> 0x1234567890123456789012345678901234567890
// setSb(bool): true ->
// checkSb() -> true
