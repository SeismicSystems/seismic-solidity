contract C {
    saddress a;
    function f() external returns (bool, bytes memory) {
        return a.call("");
    }
}
// ----
// TypeError 10208: (101-107): Member "call" not found or not visible after argument-dependent lookup in saddress. Cast to address first: "address(a).call".
