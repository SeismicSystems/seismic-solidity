// Tests struct with sbytes member: set, copy to zero out, delete
// Adapted from struct_containing_bytes_copy_and_delete.sol
contract C {
    struct Struct {
        uint256 a;
        sbytes data;
        uint256 b;
    }
    Struct data1;
    Struct data2;

    function set(uint256 _a, uint256 _b, uint256 dataLen) public returns (bool) {
        data1.a = _a;
        data1.b = _b;
        delete data1.data;
        for (uint256 i = 0; i < dataLen; i++)
            data1.data.push(sbytes1(uint8(i + 0x31)));
        return true;
    }

    function copy() public returns (bool) {
        data1 = data2;
        return true;
    }

    function del() public returns (bool) {
        delete data1;
        return true;
    }

    function test(uint256 i) public returns (bytes1) {
        return bytes1(data1.data[i]);
    }

    function length() public returns (uint256) {
        return uint256(suint256(data1.data.length));
    }

    function getA() public returns (uint256) {
        return data1.a;
    }
}
// ----
// set(uint256,uint256,uint256): 12, 13, 33 -> true
// test(uint256): 32 -> left(0x51)
// length() -> 33
// getA() -> 12
// copy() -> true
// length() -> 0
// set(uint256,uint256,uint256): 12, 13, 33 -> true
// length() -> 33
// del() -> true
// length() -> 0
