contract C {
    function f() public view returns (address payable a, address b) {
        (saddress c, saddress payable d) = (saddress(this), payable(saddress(0)));
        (a,b) = (payable(address(d)),address(c));
    }
}
// ----
// Warning 10313: (191-201): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (203-213): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
