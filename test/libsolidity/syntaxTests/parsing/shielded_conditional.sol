contract TestSbool {
    function f(sbool c) public returns (uint) {
        if (c) {
            return 1;
        } else {
            return 2;
        }
    }

    function g(sbool c) public returns (uint) {
        return c ? 1 : 2;
    }

    function h() public returns (uint) {
        sbool i = sbool(true);
        for (; i; ) {
            return 3;
        }
        return 4;
    }
}

// ----
// Warning 9661: (304-315): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 2018: (25-162): Function state mutability can be restricted to pure
// Warning 2018: (168-243): Function state mutability can be restricted to pure
// Warning 2018: (249-394): Function state mutability can be restricted to pure
