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
// Warning 10416: (156-159): Shielded number literals will leak during contract deployment.
// Warning 10416: (176-178): Shielded number literals will leak during contract deployment.
// Warning 10416: (195-202): Shielded number literals will leak during contract deployment.
