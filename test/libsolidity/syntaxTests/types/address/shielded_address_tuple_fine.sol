contract C {
    function f() public view returns (saddress payable a, saddress b) {
        (saddress c, saddress payable d) = (saddress(this), payable(saddress(0)));
        (a,b) = (d,c);
    }
}
// ----
