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
// TypeError 9553: (655-657): Invalid type for argument in function call. Invalid implicit conversion from saddress[] memory to address[] memory requested.
// TypeError 9553: (694-695): Invalid type for argument in function call. Invalid implicit conversion from address[] memory to saddress[] memory requested.
// TypeError 9574: (841-892): Type address[] memory is not implicitly convertible to expected type saddress[] memory.
// TypeError 9574: (902-952): Type saddress[] memory is not implicitly convertible to expected type address[] memory.
