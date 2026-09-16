contract C {
    struct S {
        suint32 a;
        suint32[3] b;
        suint32[] x;
    }
    S s;
    function f() public returns (uint256 ret) {
        assembly {
            cstore(s.slot, 1427247692705959881058285969449495136382746623)
        }
        s.a = suint32(1);
        s.b[0] = suint32(2); s.b[1] = suint32(3);
        s.x.push(suint32(4)); s.x.push(suint32(5));
        delete s;
        assert(uint32(s.a) == 0);
        assert(uint32(s.b[0]) == 0);
        assert(uint32(s.b[1]) == 0);
        assert(uint256(s.x.length) == 0);
        assembly {
            ret := cload(s.slot)
        }
    }
}
// ====
// compileViaYul: true
// ----
// f() -> 0
