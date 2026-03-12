contract C {
    saddress a;
    function f() external view returns (uint256) {
        return a.balance;
    }
}
// ----
// TypeError 10208: (95-104): Member "balance" not found or not visible after argument-dependent lookup in saddress. Cast to address first: "address(a).balance".
