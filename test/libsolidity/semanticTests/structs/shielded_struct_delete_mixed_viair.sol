contract C {
    struct S {
        uint16 x;
        sbytes1 a;
        uint8 y;
    }
    
    S s;
    
    function test() public returns (uint16, uint8) {
        s.x = 42;
        s.a = sbytes1(0x10);
        s.y = 7;
        delete s;
        return (s.x, s.y);
    }
}
// ====
// compileViaYul: also
// ----
// test() -> 0, 0
