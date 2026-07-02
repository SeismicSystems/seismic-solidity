// Non-bool conditions must produce a TypeError, not a crash.
contract C {
    function f() public pure {
        if (1) {}
        while (2) {}
        for (; 3; ) {}
        uint x = 1 ? 0 : 1;
    }
}
// ----
// TypeError 7407: (118-119): Type int_const 1 is not implicitly convertible to expected type bool.
// TypeError 7407: (139-140): Type int_const 2 is not implicitly convertible to expected type bool.
// TypeError 7407: (160-161): Type int_const 3 is not implicitly convertible to expected type bool.
// TypeError 7407: (185-186): Type int_const 1 is not implicitly convertible to expected type bool.
