contract C {
    function test() internal pure {
        uint256 a = 1;
        suint256 b = suint256(1);

        // Implicit conversion from uint to suint should fail
        suint256 c = a;

        // Implicit conversion from suint to uint should fail
        uint256 d = b;
    }
}
// ----
// Warning 9660: (93-104): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9574: (177-191): Type uint256 is not implicitly convertible to expected type suint256.
// TypeError 9574: (264-277): Type suint256 is not implicitly convertible to expected type uint256.
