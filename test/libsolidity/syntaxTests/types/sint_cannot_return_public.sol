// Adapted from: syntaxTests/types/suint_cannot_return_public.sol
contract C {
    function f() public pure returns (sint256) {
        return sint256(1);
    }
}
// ----
// TypeError 7492: (117-124): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9660: (143-153): Literals converted to shielded integers will leak during contract deployment.
