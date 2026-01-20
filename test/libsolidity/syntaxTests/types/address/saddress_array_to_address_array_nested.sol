contract C {
    function testNestedArrays() external pure {
        saddress[][] memory sa2d = new saddress[][](3);
        address[][] memory a2d = new address[][](3);
        // Both directions should fail for nested arrays
        a2d = sa2d;
        sa2d = a2d;
    }

    function testNestedInFunction(saddress[][] memory sa2d, address[][] memory a2d) external pure {
        // Assignment from parameters
        address[][] memory a_local = sa2d;
        saddress[][] memory sa_local = a2d;
    }

    function takesNestedAddressArray(address[][] memory arr) internal pure {}
    function takesNestedSaddressArray(saddress[][] memory arr) internal pure {}

    function testNestedFunctionParam() external pure {
        saddress[][] memory sa2d = new saddress[][](3);
        address[][] memory a2d = new address[][](3);
        // Both directions should fail
        takesNestedAddressArray(sa2d);
        takesNestedSaddressArray(a2d);
    }
}
// ----
// TypeError 7407: (217-221): Type saddress[][] memory is not implicitly convertible to expected type address[][] memory.
// TypeError 7407: (236-239): Type address[][] memory is not implicitly convertible to expected type saddress[][] memory.
// TypeError 7407: (398-402): Type saddress[][] memory is not implicitly convertible to expected type address[][] memory.
// TypeError 7407: (440-443): Type address[][] memory is not implicitly convertible to expected type saddress[][] memory.
// TypeError 6160: (752-756): Wrong argument type saddress[][] memory supplied to function. Expected address[][] memory.
// TypeError 6160: (790-793): Wrong argument type address[][] memory supplied to function. Expected saddress[][] memory.
