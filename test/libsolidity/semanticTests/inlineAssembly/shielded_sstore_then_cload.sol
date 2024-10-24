contract C {
    uint256 a;

    function f1() public {
        a = 7;
    }

    function f() public returns (suint256 x) {
       assembly {
            x := cload(a.slot)
       }
    }
}
// ----
// f1()
// f() -> FAILURE

