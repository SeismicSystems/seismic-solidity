contract test {
    struct testStruct {
        suint256 m_value;
    }
    mapping(uint256 => testStruct) campaigns;

    constructor() {
        campaigns[0].m_value = suint256(2);
    }

    function deleteIt() public returns (uint256) {
        delete campaigns[0];
        return uint256(campaigns[0].m_value);
    }
}
// ----
// deleteIt() -> 0
