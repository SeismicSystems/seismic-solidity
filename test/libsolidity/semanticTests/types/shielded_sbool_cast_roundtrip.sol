contract C {
    function boolToSboolToBool(bool a) public pure returns (bool) {
        sbool x = sbool(a);
        return bool(x);
    }

    function compareThenCast(uint256 a, uint256 b) public pure returns (bool) {
        sbool x = sbool(a > b);
        return bool(x);
    }

    function invertThroughSbool(bool a) public pure returns (bool) {
        sbool x = sbool(a);
        return bool(!x);
    }
}
// ----
// boolToSboolToBool(bool): true -> true
// boolToSboolToBool(bool): false -> false
// compareThenCast(uint256,uint256): 7, 3 -> true
// compareThenCast(uint256,uint256): 3, 7 -> false
// compareThenCast(uint256,uint256): 5, 5 -> false
// invertThroughSbool(bool): true -> false
// invertThroughSbool(bool): false -> true
