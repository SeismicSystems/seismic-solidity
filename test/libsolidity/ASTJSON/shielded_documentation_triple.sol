contract C {
    /// test
    suint a;
    function f() public pure returns (uint x) {
        /// test2
        for (suint i = suint(0); i < suint(20); i++) {
            /// tee
            /// s "t" 3
            x *= 2;
        }
        /** tes "t4" */
        return uint(x);
    }
}

// ----
