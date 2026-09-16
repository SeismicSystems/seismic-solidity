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
// Warning 10416: (126-129): Shielded number literals will leak during contract deployment.
// Warning 10416: (150-154): Shielded number literals will leak during contract deployment.
// Warning 10416: (177-181): Shielded number literals will leak during contract deployment.
// Warning 10416: (202-206): Shielded number literals will leak during contract deployment.
// Warning 10416: (245-247): Shielded number literals will leak during contract deployment.
// Warning 2072: (113-123): Unused local variable.
// Warning 2072: (139-147): Unused local variable.
// Warning 2072: (164-173): Unused local variable.
// Warning 2072: (191-198): Unused local variable.
// Warning 2072: (232-242): Unused local variable.
// Warning 2018: (17-254): Function state mutability can be restricted to pure
