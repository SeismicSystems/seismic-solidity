contract C {
    struct S {
        suint32 a;
        S[] x;
    }
    S s;
    function f() public returns (uint256 r1, uint256 r2, uint256 r3) {
        assembly {
            cstore(s.slot, 1427247692705959881058285969449495136382746623)
        }
        s.a = suint32(1);
        s.x.push(); s.x.push();
        S storage ptr1 = s.x[0];
        S storage ptr2 = s.x[1];
        assembly {
            cstore(ptr1.slot, 1427247692705959881058285969449495136382746623)
            cstore(ptr2.slot, 1427247692705959881058285969449495136382746623)
        }
        s.x[0].a = suint32(2); s.x[1].a = suint32(3);
        delete s;
        assert(uint32(s.a) == 0);
        assert(uint256(s.x.length) == 0);
        assembly {
            r1 := cload(s.slot)
            r2 := cload(ptr1.slot)
            r3 := cload(ptr2.slot)
        }
    }
}
// ====
// compileViaYul: true
// ----
// f() -> 0, 0, 0
