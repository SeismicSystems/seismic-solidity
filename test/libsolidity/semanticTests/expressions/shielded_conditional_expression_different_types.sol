contract test {
    function f(sbool cond) public returns (uint) {
        suint8 x = suint8(0xcd);
        suint16 y = suint16(0xabab);
        return cond ? uint(x) : uint(y);
    }
}
// ----
// f(sbool): true -> 0xcd
// f(sbool): false -> 0xabab

