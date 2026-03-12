contract C {
    function test() internal {
        // Local variable declaration with shielded literals
        suint256 a = 42s;
        suint8 b = 255s;
        sint256 c = -100s;
        sint8 d = -128s;
        // Zero
        suint256 e = 0s;
    }
}
// ----
// Warning 9660: (126-129): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (150-154): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (177-181): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (202-206): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (245-247): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 2072: (113-123): Unused local variable.
// Warning 2072: (139-147): Unused local variable.
// Warning 2072: (164-173): Unused local variable.
// Warning 2072: (191-198): Unused local variable.
// Warning 2072: (232-242): Unused local variable.
// Warning 2018: (17-254): Function state mutability can be restricted to pure
