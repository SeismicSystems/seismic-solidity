contract A {
    struct S {
        saddress a;
    }
    S s;
    function f() public {
        s.a = saddress(this);
    }
}
contract B {
    struct S {
        saddress payable a;
    }
    S s;
    function f() public {
        s.a = payable(this);
    }
    receive() external payable {
    }
}
// ----
