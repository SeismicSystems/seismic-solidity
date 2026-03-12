contract C {
    function test() internal {
        // abi.encode with shielded literal should fail
        bytes memory b = abi.encode(42s);
    }
}
// ----
// Warning 9667: (136-139): Shielded number literals will leak during contract deployment.
// TypeError 10202: (136-139): Shielded types cannot be ABI encoded.
