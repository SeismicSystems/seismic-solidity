contract C {
    function f() public pure {
        saddress payable a = payable(uint160(0));
        saddress payable b = payable(bytes20(0));
        saddress payable c = payable(2);
        // hex literal that is only 15 bytes long
        saddress payable d = payable(0x002190356cBB839Cbe05303d7705Fa);

        // The opposite should also be disallowed
        uint160 a1 = uint160(payable(0));
        bytes20 b1 = bytes20(payable(0));
    }
}
// ----
// TypeError 9640: (73-92): Explicit type conversion not allowed from "uint160" to "address payable".
// TypeError 9574: (52-92): Type address payable is not implicitly convertible to expected type saddress payable.
// TypeError 9640: (123-142): Explicit type conversion not allowed from "bytes20" to "address payable".
// TypeError 9574: (102-142): Type address payable is not implicitly convertible to expected type saddress payable.
// TypeError 9640: (173-183): Explicit type conversion not allowed from "int_const 2" to "address payable".
// TypeError 9574: (152-183): Type address payable is not implicitly convertible to expected type saddress payable.
// TypeError 9640: (264-305): Explicit type conversion not allowed from "int_const 6807...(25 digits omitted)...4970" to "address payable".
// TypeError 9574: (243-305): Type address payable is not implicitly convertible to expected type saddress payable.
// TypeError 9640: (379-398): Explicit type conversion not allowed from "address payable" to "uint160".
// TypeError 9640: (421-440): Explicit type conversion not allowed from "address payable" to "bytes20".
