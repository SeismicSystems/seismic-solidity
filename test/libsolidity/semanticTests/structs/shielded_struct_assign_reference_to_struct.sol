contract test {
    struct testStruct {
        suint256 m_value;
    }
    testStruct data1;
    testStruct data2;
    testStruct data3;

    constructor() {
        data1.m_value = suint256(2);
    }

    function assign()
        public
        returns (
            uint256 ret_local,
            uint256 ret_global,
            uint256 ret_global3,
            uint256 ret_global1
        )
    {
        testStruct storage x = data1;
        data2 = data1;

        ret_local = uint256(x.m_value);
        ret_global = uint256(data2.m_value);

        x.m_value = suint256(3);
        data3 = x;
        ret_global3 = uint256(data3.m_value);
        ret_global1 = uint256(data1.m_value);
    }
}
// ----
// assign() -> 2, 2, 3, 3
