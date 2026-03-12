// Adapted from: syntaxTests/types/suint_cannot_be_abi_encoded.sol
contract C {
    function test() internal pure {
        sint256 x = sint256(1);
        abi.encode(x);
    }
}
// ----
// Warning 10403: (136-146): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10202: (167-168): Shielded types cannot be ABI encoded.
