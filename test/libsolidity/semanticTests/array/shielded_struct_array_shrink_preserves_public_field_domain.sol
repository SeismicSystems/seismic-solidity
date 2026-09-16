contract C {
    struct S { suint256 priv; uint256 pub; }

    S[] private arr;
    S[] private empty;

    function setup() external { arr.push(S(suint256(1), 0xAA)); }
    function shrink() external { arr = empty; }
    function repush() external { arr.push(S(suint256(2), 0xBB)); }
    function readPub() external view returns (uint256) { return arr[0].pub; }
}
// ----
// setup() ->
// shrink() ->
// repush() ->
// readPub() -> 0xBB
