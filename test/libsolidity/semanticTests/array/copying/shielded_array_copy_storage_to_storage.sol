// Tests that copying shielded arrays from storage to storage uses cstore/cload
contract C {
    suint[] a;
    suint[] b;

    function setA(suint[] memory m) public {
        a = m;
    }

    function copyAtoB() public {
        b = a;
    }

    function getLengthA() public view returns (uint256) {
        return uint256(a.length);
    }

    function getLengthB() public view returns (uint256) {
        return uint256(b.length);
    }

    function getA(uint256 i) public view returns (uint256) {
        return uint256(a[i]);
    }

    function getB(uint256 i) public view returns (uint256) {
        return uint256(b[i]);
    }
}
// ----
// getLengthA() -> 0x00
// getLengthB() -> 0x00
// setA(suint256[]): 0x20, 0x04, 0x0a, 0x0b, 0x0c, 0x0d ->
// getLengthA() -> 0x04
// getA(uint256): 1 -> 0x0b
// copyAtoB() ->
// getLengthB() -> 0x04
// getB(uint256): 0 -> 0x0a
// getB(uint256): 1 -> 0x0b
// getB(uint256): 2 -> 0x0c
// getB(uint256): 3 -> 0x0d
