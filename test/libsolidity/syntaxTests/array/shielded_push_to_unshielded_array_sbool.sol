// Cannot push a shielded sbool to a non-shielded bool[] array
contract C {
    bool[] arr;

    function test() external {
        sbool x = sbool(true);
        arr.push(x);
    }
}
// ----
// Warning 10406: (142-153): Bool Literals converted to shielded bools will leak during contract deployment.
// TypeError 10206: (163-171): Cannot push a shielded type to a non-shielded array
