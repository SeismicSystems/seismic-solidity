contract C {
    function test() internal {
        // abi.encode with shielded literal should fail
        bytes memory b = abi.encode(42s);
    }
}
// ----
// Warning 9660: (136-139): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 3648: (136-139): Shielded types cannot be ABI encoded.
