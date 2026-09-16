// Deleting individual mixed-type struct members
contract C {
    struct S {
        uint256 a;
        suint256 b;
        uint128 c;
        suint128 d;
        bool e;
        sbool f;
    }

    S s;

    function setup() public {
        s.a = 1;
        s.b = suint256(2);
        s.c = 3;
        s.d = suint128(4);
        s.e = true;
        s.f = sbool(true);
    }

    function getAll() public returns (
        uint256 a, uint256 b, uint128 c, uint128 d, bool e, bool f
    ) {
        a = s.a;
        b = uint256(s.b);
        c = s.c;
        d = uint128(s.d);
        e = s.e;
        f = bool(s.f);
    }

    function deleteShielded() public {
        delete s.b;
        delete s.d;
        delete s.f;
    }

    function deleteUnshielded() public {
        delete s.a;
        delete s.c;
        delete s.e;
    }

    function deleteAll() public {
        delete s;
    }
}
// ----
// setup() ->
// getAll() -> 1, 2, 3, 4, true, true
// deleteShielded() ->
// getAll() -> 1, 0, 3, 0, true, false
// setup() ->
// deleteUnshielded() ->
// getAll() -> 0, 2, 0, 4, false, true
// setup() ->
// deleteAll() ->
// getAll() -> 0, 0, 0, 0, false, false
