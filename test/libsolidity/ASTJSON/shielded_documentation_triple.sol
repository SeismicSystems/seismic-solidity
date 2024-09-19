contract C {
    /// test
    suint a;
    function f() public pure returns (suint x) {
        /// test2
        for (suint i = 0; i < 20; i++) {
            /// tee
            /// s "t" 3
            x *= 2;
        }
        /** tes "t4" */
        return x;
    }
}

// ----
