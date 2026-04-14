contract test {
    struct topStruct {
        nestedStruct nstr;
        suint256 topValue;
        mapping (uint => uint) topMapping;
    }
    suint256 toDelete;
    topStruct str;
    struct nestedStruct {
        suint256 nestedValue;
        mapping (uint => bool) nestedMapping;
    }
    constructor() {
        toDelete = suint256(5);
        str.topValue = suint256(1);
        str.topMapping[0] = 1;
        str.topMapping[1] = 2;

        str.nstr.nestedValue = suint256(2);
        str.nstr.nestedMapping[0] = true;
        str.nstr.nestedMapping[1] = false;
        delete str;
        delete toDelete;
    }
    function getToDelete() public returns (uint256 res){
        res = uint256(toDelete);
    }
    function getTopValue() public returns(uint256 topValue){
        topValue = uint256(str.topValue);
    }
    function getNestedValue() public returns(uint256 nestedValue){
        nestedValue = uint256(str.nstr.nestedValue);
    }
    function getTopMapping(uint index) public returns(uint ret) {
        ret = str.topMapping[index];
    }
    function getNestedMapping(uint index) public returns(bool ret) {
        return str.nstr.nestedMapping[index];
    }
}
// ----
// getToDelete() -> 0
// getTopValue() -> 0
// getNestedValue() -> 0 #mapping values should be the same#
// getTopMapping(uint256): 0 -> 1
// getTopMapping(uint256): 1 -> 2
// getNestedMapping(uint256): 0 -> true
// getNestedMapping(uint256): 1 -> false
