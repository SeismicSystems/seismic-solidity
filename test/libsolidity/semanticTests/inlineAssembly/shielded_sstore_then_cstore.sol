contract C {
    uint256 a;

    function set() public {
        a = 7;
    }

    function deletea() public {
        delete a;
    }

    function f() public {
       assembly {
            cstore(a.slot, 42)
       }
    }
}
// ----
// set()
// f() -> FAILURE
// deletea()
// f()
