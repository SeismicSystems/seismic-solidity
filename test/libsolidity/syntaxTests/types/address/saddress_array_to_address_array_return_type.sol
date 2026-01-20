contract C {
    saddress[] sa;
    address[] a;

    function returnsAddressArray() external view returns (address[] memory) {
        // Should fail: returning saddress[] where address[] is expected
        return sa;
    }

    function returnsSaddressArray() external view returns (saddress[] memory) {
        // Should fail: returning address[] where saddress[] is expected
        return a;
    }

    function returnsAddressArrayMemory() external pure returns (address[] memory) {
        saddress[] memory sa_mem = new saddress[](5);
        // Should fail: returning saddress[] memory where address[] memory is expected
        return sa_mem;
    }

    function returnsSaddressArrayMemory() external pure returns (saddress[] memory) {
        address[] memory a_mem = new address[](5);
        // Should fail: returning address[] memory where saddress[] memory is expected
        return a_mem;
    }
}
// ----
// TypeError 6160: (204-206): Return argument type saddress[] memory is not implicitly convertible to expected type (type of first return variable) address[] memory.
// TypeError 6160: (366-367): Return argument type address[] memory is not implicitly convertible to expected type (type of first return variable) saddress[] memory.
// TypeError 6160: (596-602): Return argument type saddress[] memory is not implicitly convertible to expected type (type of first return variable) address[] memory.
// TypeError 6160: (808-813): Return argument type address[] memory is not implicitly convertible to expected type (type of first return variable) saddress[] memory.
