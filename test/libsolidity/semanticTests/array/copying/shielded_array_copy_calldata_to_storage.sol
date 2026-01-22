// Tests that copying shielded arrays from calldata to storage uses cstore
contract C {
    suint[] b;

    function f(suint[] calldata c) public {
        b = c;
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
// f(suint256[]): 0x20, 0x05, 0x64, 0x65, 0x66, 0x67, 0x68 ->
// getLength() -> 0x05
// get(uint256): 0 -> 0x64
// get(uint256): 4 -> 0x68
