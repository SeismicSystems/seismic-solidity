// Tests struct with sbytes: populate via push, short and long values, delete reset
// Adapted from copy_byte_array_in_struct_to_storage.sol
struct S {
    uint16 x;
    sbytes a;
    uint16 y;
    sbytes b;
}

contract C {
    uint256 padding;
    S data;

    function f() public returns (bool) {
        data.x = 7;
        data.y = 9;

        // Short value for a (6 bytes)
        delete data.a;
        data.a.push(sbytes1(0x61));
        data.a.push(sbytes1(0x62));
        data.a.push(sbytes1(0x63));
        data.a.push(sbytes1(0x64));
        data.a.push(sbytes1(0x65));
        data.a.push(sbytes1(0x66));

        // Long value for b (40 bytes) — use index writes after allocation
        data.b = new sbytes(40);
        for (uint256 i = 0; i < 40; i++)
            data.b[i] = sbytes1(uint8(i + 0x31));

        require(uint256(suint256(data.a.length)) == 6);
        require(data.a[0] == sbytes1(0x61));
        require(data.a[5] == sbytes1(0x66));
        require(uint256(suint256(data.b.length)) == 40);
        require(data.b[0] == sbytes1(0x31));
        require(data.b[39] == sbytes1(uint8(39 + 0x31)));
        return true;
    }

    function g() public returns (bool) {
        data.x = 7;
        data.y = 9;

        // Short value for b (17 bytes)
        delete data.b;
        for (uint256 i = 0; i < 17; i++)
            data.b.push(sbytes1(uint8(i + 0x31)));

        // Long value for a (40 bytes) — use index writes after allocation
        data.a = new sbytes(40);
        for (uint256 i = 0; i < 40; i++)
            data.a[i] = sbytes1(uint8(i + 0x31));

        require(uint256(suint256(data.a.length)) == 40);
        require(uint256(suint256(data.b.length)) == 17);
        return true;
    }

    function h() public returns (bool) {
        delete data;
        require(uint256(suint256(data.a.length)) == 0);
        require(uint256(suint256(data.b.length)) == 0);
        return true;
    }
}
// ----
// f() -> true
// g() -> true
// h() -> true
