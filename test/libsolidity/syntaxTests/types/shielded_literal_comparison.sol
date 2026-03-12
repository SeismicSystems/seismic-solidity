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
// Warning 9660: (139-141): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (145-147): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (193-195): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (199-201): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (246-248): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (251-253): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (301-303): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (306-308): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (362-364): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (368-370): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (427-429): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (433-435): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 2072: (52-70): Unused local variable.
// Warning 2018: (17-443): Function state mutability can be restricted to pure
