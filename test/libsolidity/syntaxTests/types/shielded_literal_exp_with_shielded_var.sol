// Test: exponentiation with shielded variable base and shielded literal exponent
contract C {
    suint256 private x;
    suint256 private base;

    function test() internal {
        base = 2s;
        // Shielded var ** shielded literal
        x = base ** 8s;
        // Shielded literal ** shielded var
        x = 2s ** base;
    }
}
// ----
// Warning 10416: (193-195): Shielded number literals will leak during contract deployment.
// Warning 10416: (261-263): Shielded number literals will leak during contract deployment.
// Warning 10416: (321-323): Shielded number literals will leak during contract deployment.
// Warning 10304: (321-331): Shielded integer exponentiation will leak the exponent value through gas cost.
