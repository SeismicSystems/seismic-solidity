contract C {
    function f() public view returns (address payable a, address b) {
        (saddress c, saddress payable d) = (saddress(this), payable(saddress(0)));
        (a,b) = (payable(address(c)),address(d));
    }
}
// ----
