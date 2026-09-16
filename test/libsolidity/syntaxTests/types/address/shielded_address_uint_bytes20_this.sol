contract C {
    function f() public view {
        saddress a1 = saddress(uint160(0));
        saddress a2 = saddress(bytes20(0));
        saddress a3 = saddress(this);

        // Trivial conversions
        saddress payable a4 = payable(saddress(uint160(0)));
        saddress payable a5 = payable(saddress(bytes20(0)));
        saddress payable a6 = payable(saddress(this));

        a1; a2; a3; a4; a5; a6;
    }

    // to make payable(this) work
    receive() payable external {
    }
}
// ----
