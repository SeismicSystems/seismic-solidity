contract C {
    saddress[] sa;
    address[] a;

    function returnsAddressArray() external view returns (address[] memory) {
        // Should fail: returning saddress[] where address[] is expected
        return sa;
    }

    function returnsSaddressArray() internal view returns (saddress[] memory) {
        // Should fail: returning address[] where saddress[] is expected
        return a;
    }

    // External wrapper to test the internal function
    function testReturnsSaddressArray() external view {
        address[] memory result = returnsSaddressArray();
    }

    function returnsAddressArrayMemory() external pure returns (address[] memory) {
        saddress[] memory sa_mem = new saddress[](5);
        // Should fail: returning saddress[] memory where address[] memory is expected
        return sa_mem;
    }

    function returnsSaddressArrayMemory() internal pure returns (saddress[] memory) {
        address[] memory a_mem = new address[](5);
        // Should fail: returning address[] memory where saddress[] memory is expected
        return a_mem;
    }

    // External wrapper to test the internal function
    function testReturnsSaddressArrayMemory() external pure {
        address[] memory result = returnsSaddressArrayMemory();
    }
}
// ----
// Warning 9665: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 6359: (216-218): Return argument type saddress[] storage ref is not implicitly convertible to expected type (type of first return variable) address[] memory.
// TypeError 6359: (395-396): Return argument type address[] storage ref is not implicitly convertible to expected type (type of first return variable) saddress[] memory.
// TypeError 9574: (523-571): Type saddress[] memory is not implicitly convertible to expected type address[] memory.
// TypeError 6359: (820-826): Return argument type saddress[] memory is not implicitly convertible to expected type (type of first return variable) address[] memory.
// TypeError 6359: (1074-1079): Return argument type address[] memory is not implicitly convertible to expected type (type of first return variable) saddress[] memory.
// TypeError 9574: (1212-1266): Type saddress[] memory is not implicitly convertible to expected type address[] memory.
