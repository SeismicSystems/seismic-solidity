contract C {
    suint256 a;

    function f() public returns (uint256 x) {
       assembly {
            x := cload(a.slot)
       }
    }
}
// ----
// f() -> 0
