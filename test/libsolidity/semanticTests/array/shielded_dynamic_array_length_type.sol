// Verifies that dynamic shielded array .length returns suint256
// while fixed-length shielded array .length returns uint256
contract C {
    suint[] dynamicArray;
    suint[5] fixedArray;

    function testDynamicLengthIsSuint() public returns (uint256) {
        dynamicArray.push(suint(1));
        dynamicArray.push(suint(2));
        // .length is suint256 for dynamic shielded arrays, cast to uint for return
        return uint256(dynamicArray.length);
    }

    function testFixedLengthIsUint() public view returns (uint256) {
        // .length is uint256 for fixed-length shielded arrays
        return fixedArray.length;
    }

    function testDynamicLengthComparison() public returns (bool) {
        dynamicArray.push(suint(10));
        dynamicArray.push(suint(20));
        dynamicArray.push(suint(30));
        // Compare suint length with suint value (2 from first test + 3 = 5)
        return bool(dynamicArray.length == suint(5));
    }
}
// ----
// testDynamicLengthIsSuint() -> 2
// testFixedLengthIsUint() -> 5
// testDynamicLengthComparison() -> true
