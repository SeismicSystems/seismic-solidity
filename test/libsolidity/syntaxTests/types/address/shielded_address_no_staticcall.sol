contract C {
    saddress a;
    function f() external view returns (bool, bytes memory) {
        return a.staticcall("");
    }
}
// ----
// TypeError 3125: (106-118): Member "staticcall" not found or not visible after argument-dependent lookup in saddress. Cast to address first: "address(a).staticcall".
