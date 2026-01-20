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
// TypeError 6160: (341-343): Wrong argument type address[] memory supplied to function. Expected saddress[] memory.
// TypeError 6160: (271-273): Wrong argument type saddress[] memory supplied to function. Expected address[] memory.
// TypeError 6160: (584-590): Wrong argument type saddress[] memory supplied to function. Expected address[] memory.
// TypeError 6160: (617-622): Wrong argument type address[] memory supplied to function. Expected saddress[] memory.
