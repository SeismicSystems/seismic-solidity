contract C {
    mapping(uint256 => suint256) private m;

    function test() internal {
        // Assign shielded literal to mapping value
        m[0] = 42s;
        m[1] = 0s;
        m[2] = 0xDEADs;
    }
}
// ----
// Warning 9660: (156-159): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (176-178): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (195-202): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
