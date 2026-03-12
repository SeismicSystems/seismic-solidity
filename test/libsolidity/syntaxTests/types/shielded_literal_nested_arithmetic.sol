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
// Warning 9667: (157-159): Shielded number literals will leak during contract deployment.
// Warning 9667: (162-164): Shielded number literals will leak during contract deployment.
// Warning 9667: (168-170): Shielded number literals will leak during contract deployment.
// Warning 9667: (184-187): Shielded number literals will leak during contract deployment.
// Warning 9667: (191-193): Shielded number literals will leak during contract deployment.
// Warning 9667: (196-198): Shielded number literals will leak during contract deployment.
// Warning 9667: (214-218): Shielded number literals will leak during contract deployment.
// Warning 9667: (221-224): Shielded number literals will leak during contract deployment.
// Warning 9667: (229-232): Shielded number literals will leak during contract deployment.
// Warning 9667: (235-237): Shielded number literals will leak during contract deployment.
// Warning 9667: (279-282): Shielded number literals will leak during contract deployment.
// Warning 9667: (285-287): Shielded number literals will leak during contract deployment.
// Warning 9667: (291-293): Shielded number literals will leak during contract deployment.
// Warning 9667: (309-311): Shielded number literals will leak during contract deployment.
// Warning 9667: (314-316): Shielded number literals will leak during contract deployment.
