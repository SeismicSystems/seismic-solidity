contract C {
    saddress[] sa;
    address[] a;

    function takesAddressArray(address[] memory arr) internal pure {}
    function takesSaddressArray(saddress[] memory arr) internal pure {}

    function testMemoryParam() external view {
        // Passing saddress[] where address[] is expected
        takesAddressArray(sa);
        // Passing address[] where saddress[] is expected
        takesSaddressArray(a);
    }

    function testWithLocal() external pure {
        saddress[] memory sa_mem = new saddress[](5);
        address[] memory a_mem = new address[](5);
        // Both directions should fail
        takesAddressArray(sa_mem);
        takesSaddressArray(a_mem);
    }
}
// ----
// Warning 9665: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9553: (324-326): Invalid type for argument in function call. Invalid implicit conversion from saddress[] storage ref to address[] memory requested.
// TypeError 9553: (414-415): Invalid type for argument in function call. Invalid implicit conversion from address[] storage ref to saddress[] memory requested.
// TypeError 9553: (640-646): Invalid type for argument in function call. Invalid implicit conversion from saddress[] memory to address[] memory requested.
// TypeError 9553: (676-681): Invalid type for argument in function call. Invalid implicit conversion from address[] memory to saddress[] memory requested.
