contract C {
    function f() public view returns (saddress payable a, saddress b) {
        (saddress c, saddress payable d) = (saddress(this), payable(0));
        (a,b) = (c,d);
    }
}
// ----
// TypeError 7407: (169-174): Type tuple(saddress,saddress payable) is not implicitly convertible to expected type tuple(saddress payable,saddress).
