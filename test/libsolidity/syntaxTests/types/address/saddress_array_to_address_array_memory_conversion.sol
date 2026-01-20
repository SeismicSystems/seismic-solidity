contract C {
    function f(uint length) public pure {
        saddress[] memory sa = new saddress[](length);
        address[] memory a = new address[](length);
        // Both directions should fail
        a = sa;
        sa = a;
    }
}
// ----
// TypeError 7407: (179-181): Type saddress[] memory is not implicitly convertible to expected type address[] memory.
// TypeError 7407: (197-198): Type address[] memory is not implicitly convertible to expected type saddress[] memory.
