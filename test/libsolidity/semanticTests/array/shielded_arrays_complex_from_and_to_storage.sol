contract Test {
    suint256[3][] data;

    function set(suint256[3][] memory _data) public returns (uint256) {
        data = _data;
        return uint256(data.length);
    }

    function get() public view returns (uint256[3][] memory) {
        uint256[3][] memory uintData = new uint256[3][](data.length);

        for (uint256 i = 0; i < data.length; i++) {
            for (uint256 j = 0; j < 3; j++) {
                uintData[i][j] = uint256(data[i][j]);
            }
        }

        return uintData;
    }

    function get_data(uint256 index, uint256 index_2) public view returns (uint256) {
        return uint256(data[index][index_2]);
    }

}
// ----
// set(suint256[3][]): 0x20, 0x06, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12 -> 0x06
// gas irOptimized: 185216
// gas legacy: 211054
// gas legacyOptimized: 206077
// get_data(uint256,uint256): 0x02, 0x02 -> 0x09
// get_data(uint256,uint256): 0x05, 0x01 -> 0x11
// get_data(uint256,uint256): 0x06, 0x00 -> FAILURE
// get() -> 0x20, 0x06, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12
