contract C {
    suint256 private x;
    sint256 private y;

    function test() internal {
        // Nested arithmetic with shielded literals
        x = (1s + 2s) * 3s;
        x = 10s - (2s * 3s);
        x = (100s / 10s) + (50s % 7s);
        // Nested signed
        y = (-10s + 5s) * 2s;
        y = -(3s * 4s);
    }
}
// ----
// Warning 10416: (157-159): Shielded number literals will leak during contract deployment.
// Warning 10416: (162-164): Shielded number literals will leak during contract deployment.
// Warning 10416: (168-170): Shielded number literals will leak during contract deployment.
// Warning 10416: (184-187): Shielded number literals will leak during contract deployment.
// Warning 10416: (191-193): Shielded number literals will leak during contract deployment.
// Warning 10416: (196-198): Shielded number literals will leak during contract deployment.
// Warning 10416: (214-218): Shielded number literals will leak during contract deployment.
// Warning 10416: (221-224): Shielded number literals will leak during contract deployment.
// Warning 10416: (229-232): Shielded number literals will leak during contract deployment.
// Warning 10416: (235-237): Shielded number literals will leak during contract deployment.
// Warning 10416: (279-282): Shielded number literals will leak during contract deployment.
// Warning 10416: (285-287): Shielded number literals will leak during contract deployment.
// Warning 10416: (291-293): Shielded number literals will leak during contract deployment.
// Warning 10416: (309-311): Shielded number literals will leak during contract deployment.
// Warning 10416: (314-316): Shielded number literals will leak during contract deployment.
