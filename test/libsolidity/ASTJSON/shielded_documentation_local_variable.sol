contract C {
    function f() public pure {
        /// Documentation for x; will appear in ast json
        suint x = suint(1);
        for (
            /// documentation for i; will not appear in ast json
            suint i = suint(0);
            i < suint(10);
            ++i
        ) {
            /// documentation for j; will appear in ast json
            suint j = suint(0);
        }
    }
    function g(
        /// documentation for param1; will not appear in ast json
        suint param1,
        /// documentation for param2; will not appear in ast json
        suint param2,
        /// documentation for param3; will not appear in ast json
        suint param3
    ) public {}
}

// ----
