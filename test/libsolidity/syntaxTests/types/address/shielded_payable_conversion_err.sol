contract C {
    function f() public {
        saddress payable a = saddress(new D());

        // This conversion makes no sense anyway.
        saddress payable b = saddress(D);
    }
}

contract D {
    receive() external payable {
    }
}
// ----
// TypeError 9574: (47-83): Type saddress is not implicitly convertible to expected type saddress payable.
// TypeError 9640: (164-174): Explicit type conversion not allowed from "type(contract D)" to "saddress".
// TypeError 9574: (144-174): Type saddress is not implicitly convertible to expected type saddress payable.
