contract C {
    suint256 private x;
    suint128 private y;
    suint8 private z;

    function test() internal {
        // Max uint256 value as shielded literal
        x = 115792089237316195423570985008687907853269984665640564039457584007913129639935s;
        // Max uint128 value
        y = 340282366920938463463374607431768211455s;
        // Max uint8 value
        z = 255s;
    }
}
// ----
// Warning 9667: (176-255): Shielded number literals will leak during contract deployment.
// Warning 9667: (298-338): Shielded number literals will leak during contract deployment.
// Warning 9667: (379-383): Shielded number literals will leak during contract deployment.
