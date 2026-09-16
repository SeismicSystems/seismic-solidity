pragma abicoder               v2;

contract C {
    struct S {
        suint128 a;
        suint256[] x;
        suint240 b;
    }
    uint8 b = 23;
    S s;
    uint8 a = 17;
    function f() public {
        delete s;
        s.x.push(suint256(42)); s.x.push(suint256(42)); s.x.push(suint256(42));
        delete s;
        assert(uint256(s.x.length) == 0);
        suint256[] storage x = s.x;
        assembly { cstore(x.slot, 3) }
        assert(uint256(s.x[0]) == 0);
        assert(uint256(s.x[1]) == 0);
        assert(uint256(s.x[2]) == 0);
        assert(b == 23);
        assert(a == 17);
    }

    function g() public {
        delete s;
        s.x.push(suint256(42)); s.x.push(suint256(42)); s.x.push(suint256(42));
        s.a = suint128(1); s.b = suint240(2);
        delete s.x;
        assert(uint256(s.x.length) == 0);
        suint256[] storage x = s.x;
        assembly { cstore(x.slot, 3) }
        assert(uint256(s.x[0]) == 0);
        assert(uint256(s.x[1]) == 0);
        assert(uint256(s.x[2]) == 0);
        assert(b == 23);
        assert(a == 17);
        assert(uint128(s.a) == 1);
        assert(uint240(s.b) == 2);
    }
}
// ----
// f() ->
// g() ->
