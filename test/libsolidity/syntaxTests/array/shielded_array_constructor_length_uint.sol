contract C {

    function test() public pure {
        suint256[] memory arr1 = new suint256[](2);
        suint[] memory arr2 = new suint[](2);
        suint[] memory arr3 = new suint[](uint(2));
    }
}
// ----
// Warning 2072: (56-78): Unused local variable.
// Warning 2072: (108-127): Unused local variable.
// Warning 2072: (154-173): Unused local variable.
