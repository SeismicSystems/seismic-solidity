contract C {
    struct Data {
        suint256 value;
        sint256 signed_value;
    }

    Data private d;

    function testFieldAssign() public returns (uint256, int256) {
        d.value = 42s;
        d.signed_value = -10s;
        return (uint(d.value), int(d.signed_value));
    }

    function testConstructor() public returns (uint256, int256) {
        Data memory local = Data(100s, -50s);
        return (uint(local.value), int(local.signed_value));
    }

    function testUpdate() public returns (uint256) {
        d.value = 10s;
        d.value = 20s;
        return uint(d.value);
    }
}
// ----
// testFieldAssign() -> 42, -10
// testConstructor() -> 100, -50
// testUpdate() -> 20
