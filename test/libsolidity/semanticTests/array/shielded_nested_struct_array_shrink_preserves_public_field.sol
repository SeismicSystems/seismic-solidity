contract C {
    struct S { suint256 priv; uint256 pub; }

    S[2][] private arr;
    S[2][] private empty;

    function setup() external {
        arr.push();
        arr[0][0].priv = suint256(1);
        arr[0][0].pub = 0xAA;
        arr[0][1].priv = suint256(2);
        arr[0][1].pub = 0xBB;
    }
    function shrink() external { arr = empty; }
    function repush() external {
        arr.push();
        arr[0][0].pub = 0xCC;
    }
    function readPub() external view returns (uint256) { return arr[0][0].pub; }
}
// ----
// setup() ->
// shrink() ->
// repush() ->
// readPub() -> 0xCC
