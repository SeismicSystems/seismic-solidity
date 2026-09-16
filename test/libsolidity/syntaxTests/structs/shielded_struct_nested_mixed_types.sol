// Nested structs with mixed shielded/unshielded fields — pure syntax check
contract C {
    struct Inner {
        suint128 secret;
        uint128 visible;
    }
    struct Middle {
        Inner data;
        sbool flag;
        uint32 counter;
    }
    struct Outer {
        Middle m1;
        Middle m2;
        suint256 root_secret;
        uint256 root_public;
    }
    Outer private o;

    function f() internal {
        o.m1.data.secret = suint128(42);
        o.m1.data.visible = 100;
        o.m1.flag = sbool(true);
        o.m1.counter = 1;
        o.m2 = o.m1;
        o.root_secret = suint256(999);
        o.root_public = 888;
    }
}
// ----
// Warning 10403: (455-467): Literals converted to shielded integers will leak during contract deployment.
// Warning 10406: (522-533): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10403: (606-619): Literals converted to shielded integers will leak during contract deployment.
