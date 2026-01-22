// Tests that copying shielded bool arrays (multiple items per slot) uses cstore/cload
contract C {
    sbool[] a;
    sbool[] b;

    function setA(sbool[] memory m) public {
        a = m;
    }

    function copyAtoB() public {
        b = a;
    }

    function getLengthB() public view returns (uint256) {
        return b.length;
    }

    function getB(uint256 i) public view returns (bool) {
        return bool(b[i]);
    }
}
// ----
// getLengthB() -> 0x00
// setA(sbool[]): 0x20, 0x05, 0x01, 0x00, 0x01, 0x01, 0x00 ->
// copyAtoB() ->
// getLengthB() -> 0x05
// getB(uint256): 0 -> true
// getB(uint256): 1 -> false
// getB(uint256): 2 -> true
// getB(uint256): 3 -> true
// getB(uint256): 4 -> false
