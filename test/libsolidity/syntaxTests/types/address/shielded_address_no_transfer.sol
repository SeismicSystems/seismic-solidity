contract C {
    saddress payable a;
    function f() external {
        a.transfer(1);
    }
}
// ----
// TypeError 3125: (73-83): Member "transfer" not found or not visible after argument-dependent lookup in saddress payable. Cast to address first: "address(a).transfer".
