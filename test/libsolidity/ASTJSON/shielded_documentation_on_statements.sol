contract C {
    // this is not exported
    suint a;
    function f() public pure returns (suint x) {
        // test2
        for (suint i = 0; i < 20; i++) {
            // not exported either
            x *= 2;
        }
        // nor is this because they are all
        // not using the triple-slash
        return x;
    }
}

// ----
