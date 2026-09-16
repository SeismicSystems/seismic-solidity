// Adapted from: syntaxTests/types/suint_sbytes_conversions.sol
contract C {
    function test() internal pure {
        // Explicit conversions between sint and sbytes of same size should work
        sint8 a = sint8(1);
        sbytes1 b = sbytes1(a);
        sint8 c = sint8(b);

        sint16 d = sint16(1);
        sbytes2 e = sbytes2(d);
        sint16 f = sint16(e);

        sint256 g = sint256(1);
        sbytes32 h = sbytes32(g);
        sint256 i = sint256(h);
    }
}
// ----
// Warning 10403: (212-220): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9640: (242-252): Explicit type conversion not allowed from "sint8" to "sbytes1".
// TypeError 9640: (272-280): Explicit type conversion not allowed from "sbytes1" to "sint8".
// Warning 10403: (302-311): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9640: (333-343): Explicit type conversion not allowed from "sint16" to "sbytes2".
// TypeError 9640: (364-373): Explicit type conversion not allowed from "sbytes2" to "sint16".
// Warning 10403: (396-406): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9640: (429-440): Explicit type conversion not allowed from "sint256" to "sbytes32".
// TypeError 9640: (462-472): Explicit type conversion not allowed from "sbytes32" to "sint256".
