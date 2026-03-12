contract C {
    suint256 private x;
    suint8 private y;
    sint8 private z;

    function f() internal {
        // Basic shielded literal assignment
        x = 42s;
        y = 255s;
        z = -1s;

        // Hex shielded literal
        x = 0x1As;

        // Underscore shielded literal
        x = 1_000s;

        // Scientific notation shielded literal
        x = 1e5s;

        // Shielded arithmetic
        x = 1s + 2s;
    }
}
// ----
// Warning 9667: (166-169): Shielded number literals will leak during contract deployment.
// Warning 9667: (183-187): Shielded number literals will leak during contract deployment.
// Warning 9667: (202-204): Shielded number literals will leak during contract deployment.
// Warning 9667: (251-256): Shielded number literals will leak during contract deployment.
// Warning 9667: (310-316): Shielded number literals will leak during contract deployment.
// Warning 9667: (379-383): Shielded number literals will leak during contract deployment.
// Warning 9667: (429-431): Shielded number literals will leak during contract deployment.
// Warning 9667: (434-436): Shielded number literals will leak during contract deployment.
