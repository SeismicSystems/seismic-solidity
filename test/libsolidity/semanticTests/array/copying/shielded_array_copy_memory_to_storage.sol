// Tests that copying shielded arrays from memory to storage uses cstore/cload
contract C {
    suint[] b;

    function f(suint[] memory m) public {
        b = m;
    }

    function getLength() public view returns (uint256) {
        return b.length;
    }

    function get(uint256 i) public view returns (uint256) {
        return uint256(b[i]);
    }
}
// ----
// getLength() -> 0x00
// f(suint256[]): 0x20, 0x03, 0x01, 0x02, 0x03 ->
// getLength() -> 0x03
// get(uint256): 0 -> 0x01
// get(uint256): 1 -> 0x02
// get(uint256): 2 -> 0x03
