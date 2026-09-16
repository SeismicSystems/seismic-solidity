// Cannot push a shielded suint256 to a non-shielded uint256[] array
contract C {
    uint256[] arr;

    function test() external {
        suint256 x = suint256(1);
        arr.push(x);
    }
}
// ----
// Warning 10403: (154-165): Literals converted to shielded integers will leak during contract deployment.
// TypeError 10206: (175-183): Cannot push a shielded type to a non-shielded array
