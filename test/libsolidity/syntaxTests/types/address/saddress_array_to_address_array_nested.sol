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
// TypeError 7407: (241-245): Type saddress[][] memory is not implicitly convertible to expected type address[][] memory.
// TypeError 7407: (262-265): Type address[][] memory is not implicitly convertible to expected type saddress[][] memory.
// TypeError 9574: (420-453): Type saddress[][] memory is not implicitly convertible to expected type address[][] memory.
// TypeError 9574: (463-497): Type address[][] memory is not implicitly convertible to expected type saddress[][] memory.
// TypeError 9553: (900-904): Invalid type for argument in function call. Invalid implicit conversion from saddress[][] memory to address[][] memory requested.
// TypeError 9553: (940-943): Invalid type for argument in function call. Invalid implicit conversion from address[][] memory to saddress[][] memory requested.
