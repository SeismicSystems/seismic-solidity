contract C {
    saddress payable a;
    function f() external returns (bool) {
        return a.send(1);
    }
}
// ----
// TypeError 10208: (95-101): Member "send" not found or not visible after argument-dependent lookup in saddress payable. Cast to address first: "address(a).send".
