contract C {
    function test() internal {
        suint256 private_x;
        sbool private_r;

        // Equality
        private_r = (1s == 1s);
        // Inequality
        private_r = (1s != 2s);
        // Less than
        private_r = (1s < 2s);
        // Greater than
        private_r = (2s > 1s);
        // Less than or equal
        private_r = (1s <= 1s);
        // Greater than or equal
        private_r = (2s >= 1s);
    }
}
// ----
// Warning 10416: (139-141): Shielded number literals will leak during contract deployment.
// Warning 10416: (145-147): Shielded number literals will leak during contract deployment.
// Warning 10416: (193-195): Shielded number literals will leak during contract deployment.
// Warning 10416: (199-201): Shielded number literals will leak during contract deployment.
// Warning 10416: (246-248): Shielded number literals will leak during contract deployment.
// Warning 10416: (251-253): Shielded number literals will leak during contract deployment.
// Warning 10416: (301-303): Shielded number literals will leak during contract deployment.
// Warning 10416: (306-308): Shielded number literals will leak during contract deployment.
// Warning 10416: (362-364): Shielded number literals will leak during contract deployment.
// Warning 10416: (368-370): Shielded number literals will leak during contract deployment.
// Warning 10416: (427-429): Shielded number literals will leak during contract deployment.
// Warning 10416: (433-435): Shielded number literals will leak during contract deployment.
// Warning 2072: (52-70): Unused local variable.
// Warning 2018: (17-443): Function state mutability can be restricted to pure
