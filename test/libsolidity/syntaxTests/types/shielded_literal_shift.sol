contract C {
    suint256 private x;
    suint8 private y;

    function test() internal {
        // Left shift
        x = 1s << 8s;
        // Right shift
        x = 256s >> 4s;
        // Shift small type
        y = 1s << 4s;
        // Large shift
        x = 1s << 255s;
    }
}
// ----
// Warning 9667: (125-127): Shielded number literals will leak during contract deployment.
// Warning 9667: (131-133): Shielded number literals will leak during contract deployment.
// Warning 9667: (170-174): Shielded number literals will leak during contract deployment.
// Warning 9667: (178-180): Shielded number literals will leak during contract deployment.
// Warning 9667: (222-224): Shielded number literals will leak during contract deployment.
// Warning 9667: (228-230): Shielded number literals will leak during contract deployment.
// Warning 9667: (267-269): Shielded number literals will leak during contract deployment.
// Warning 9667: (273-277): Shielded number literals will leak during contract deployment.
