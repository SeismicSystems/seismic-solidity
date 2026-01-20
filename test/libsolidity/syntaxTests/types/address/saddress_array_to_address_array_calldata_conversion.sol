contract C {
    function takesAddressArrayCalldata(address[] calldata arr) external pure {}
    function takesSaddressArrayCalldata(saddress[] calldata arr) external pure {}

    function testCalldataParam(saddress[] calldata sa, address[] calldata a) external pure {
        // Both directions should fail with calldata
        takesAddressArrayCalldata(sa);
        takesSaddressArrayCalldata(a);
    }

    function testCalldataToMemory(saddress[] calldata sa, address[] calldata a) external pure {
        // Assignment from calldata to memory with wrong types
        address[] memory a_mem = sa;
        saddress[] memory sa_mem = a;
    }
}
// ----
// TypeError 6160: (345-347): Wrong argument type saddress[] calldata supplied to function. Expected address[] calldata.
// TypeError 6160: (382-383): Wrong argument type address[] calldata supplied to function. Expected saddress[] calldata.
// TypeError 7407: (539-541): Type saddress[] calldata is not implicitly convertible to expected type address[] memory.
// TypeError 7407: (577-578): Type address[] calldata is not implicitly convertible to expected type saddress[] memory.
