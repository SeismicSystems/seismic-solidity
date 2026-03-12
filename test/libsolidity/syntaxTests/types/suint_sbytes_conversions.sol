contract C {
    function test() internal pure {
        // Explicit conversions between suint and sbytes of same size should work
        suint8 a = suint8(1);
        sbytes1 b = sbytes1(a);
        suint8 c = suint8(b);

        suint16 d = suint16(1);
        sbytes2 e = sbytes2(d);
        suint16 f = suint16(e);

        suint256 g = suint256(1);
        sbytes32 h = sbytes32(g);
        suint256 i = suint256(h);
    }
}
// ----
// Warning 10403: (150-159): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (244-254): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (342-353): Literals converted to shielded integers will leak during contract deployment.
// Warning 2072: (201-209): Unused local variable.
// Warning 2072: (296-305): Unused local variable.
// Warning 2072: (397-407): Unused local variable.
