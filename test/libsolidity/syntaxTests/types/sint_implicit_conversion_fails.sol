// Adapted from: syntaxTests/types/suint_implicit_conversion_fails.sol
contract C {
    function test() internal pure {
        int256 a = 1;
        sint256 b = sint256(1);

        // Implicit conversion from int to sint should fail
        sint256 c = a;

        // Implicit conversion from sint to int should fail
        int256 d = b;
    }
}
// ----
// Warning 9660: (162-172): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9574: (243-256): Type int256 is not implicitly convertible to expected type sint256.
// TypeError 9574: (327-339): Type sint256 is not implicitly convertible to expected type int256.
