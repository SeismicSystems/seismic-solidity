contract Helper {
    function takesAddressArray(address[] memory arr) external pure {}
    function takesSaddressArray(saddress[] memory arr) external pure {}
    function returnsAddressArray() external pure returns (address[] memory) {
        return new address[](5);
    }
    function returnsSaddressArray() external pure returns (saddress[] memory) {
        return new saddress[](5);
    }
}

contract C {
    Helper helper;

    function testExternalCallParam() external view {
        saddress[] memory sa = new saddress[](5);
        address[] memory a = new address[](5);
        // Both directions should fail
        helper.takesAddressArray(sa);
        helper.takesSaddressArray(a);
    }

    function testExternalCallReturnAssignment() external view {
        // Assignment from external call with wrong return type
        saddress[] memory sa = helper.returnsAddressArray();
        address[] memory a = helper.returnsSaddressArray();
    }
}
// ----
// TypeError 6160: (568-570): Wrong argument type saddress[] memory supplied to function. Expected address[] memory.
// TypeError 6160: (604-605): Wrong argument type address[] memory supplied to function. Expected saddress[] memory.
// TypeError 7407: (731-758): Type address[] memory is not implicitly convertible to expected type saddress[] memory.
// TypeError 7407: (782-810): Type saddress[] memory is not implicitly convertible to expected type address[] memory.
