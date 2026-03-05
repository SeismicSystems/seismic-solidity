contract C {
    function testCalldataToMemory(saddress[] calldata sa, address[] calldata a) external pure {
        // Assignment from calldata to memory with wrong types
        address[] memory a_mem = sa;
        saddress[] memory sa_mem = a;
    }
}
// ----
// TypeError 9574: (180-207): Type saddress[] calldata is not implicitly convertible to expected type address[] memory.
// TypeError 9574: (217-245): Type address[] calldata is not implicitly convertible to expected type saddress[] memory.
