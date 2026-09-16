// Storage references to mixed structs: aliasing behavior
contract C {
    struct Data {
        uint256 pub;
        suint256 sec;
    }

    Data d1;
    Data d2;
    Data d3;

    constructor() {
        d1.pub = 1;
        d1.sec = suint256(10);
    }

    function testAlias() public returns (
        uint256 d1pub, uint256 d1sec,
        uint256 d2pub, uint256 d2sec,
        uint256 d3pub, uint256 d3sec
    ) {
        Data storage ref = d1;
        d2 = d1; // copy

        // Modify via reference — should also change d1
        ref.pub = 99;
        ref.sec = suint256(999);

        // d3 = ref should copy current d1 values
        d3 = ref;

        d1pub = d1.pub;
        d1sec = uint256(d1.sec);
        d2pub = d2.pub;
        d2sec = uint256(d2.sec);
        d3pub = d3.pub;
        d3sec = uint256(d3.sec);
    }
}
// ----
// testAlias() -> 99, 999, 1, 10, 99, 999
