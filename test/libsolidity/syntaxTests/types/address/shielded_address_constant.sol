contract C {
    saddress constant a = saddress(0);
    saddress payable constant b = payable(0);
    function f() public pure returns (saddress, saddress) {
        return (a,b);
    }
}
// ----
