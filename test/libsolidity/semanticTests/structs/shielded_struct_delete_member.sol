contract test {
    struct testStruct {
        suint256 m_value;
    }
    testStruct data1;

    constructor() {
        data1.m_value = suint256(2);
    }

    function deleteMember() public returns (uint256 ret_value) {
        testStruct storage x = data1;
        x.m_value = suint256(4);
        delete x.m_value;
        ret_value = uint256(data1.m_value);
    }
}
// ----
// deleteMember() -> 0
