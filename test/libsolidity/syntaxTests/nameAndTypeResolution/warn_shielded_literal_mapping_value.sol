// Mapping value assignment with shielded literal — SHOULD warn
contract C {
    mapping(uint256 => suint256) private m;
    function test() external {
        m[0] = suint256(99);
    }
}
// ----
// Warning 9660: (169-181): Literals converted to shielded integers will leak during contract deployment.
