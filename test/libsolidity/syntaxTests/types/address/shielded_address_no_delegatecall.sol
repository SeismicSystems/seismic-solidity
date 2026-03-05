contract C {
    saddress a;
    function f() external returns (bool, bytes memory) {
        return a.delegatecall("");
    }
}
// ----
// TypeError 3125: (101-115): Member "delegatecall" not found or not visible after argument-dependent lookup in saddress. Cast to address first: "address(a).delegatecall".
