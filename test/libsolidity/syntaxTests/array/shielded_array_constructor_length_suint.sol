contract C {

    function test() public pure {
        suint256[] memory arr = new suint256[](suint(2));
    }
}
// ----
// Warning 9660: (95-103): Literals converted to shielded integers will leak during contract deployment.
// TypeError 9553: (95-103): Invalid type for argument in function call. Invalid implicit conversion from suint256 to uint256 requested.
