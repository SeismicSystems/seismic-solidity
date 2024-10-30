contract C {
    suint256 a;

    function f1() public {
        a = 7;
    }

    function f() public returns (uint256 x) {
       assembly {
            x := sload(a.slot)
       }
    }
}
// ----
// f1()
// f() -> FAILURE
