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
// TypeError 7407: (213-215): Type saddress[] memory is not implicitly convertible to expected type address[] memory.
// TypeError 7407: (230-231): Type address[] memory is not implicitly convertible to expected type saddress[] memory.
