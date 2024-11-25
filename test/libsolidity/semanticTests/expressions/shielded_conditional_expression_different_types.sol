contract test {
    function f(bool cond) public returns (uint) {
        suint8 x = 0xcd;
        suint16 y = 0xabab;
        return cond ? uint(x) : uint(y);
    }
}
// ----
// f(bool): true -> 0xcd
// f(bool): false -> 0xabab

