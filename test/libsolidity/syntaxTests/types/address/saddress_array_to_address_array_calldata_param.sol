contract C {
    function takesAddressArrayCalldata(address[] calldata arr) internal pure {}
    function takesSaddressArrayCalldata(saddress[] calldata arr) internal pure {}

    function testCalldataParam(saddress[] calldata sa, address[] calldata a) external pure {
        // Both directions should fail with calldata
        takesAddressArrayCalldata(sa);
        takesSaddressArrayCalldata(a);
    }
}
// ----
// TypeError 9553: (356-358): Invalid type for argument in function call. Invalid implicit conversion from saddress[] calldata to address[] calldata requested.
// TypeError 9553: (396-397): Invalid type for argument in function call. Invalid implicit conversion from address[] calldata to saddress[] calldata requested.
