contract C {
    function test() internal pure {
        address a = address(1);
        saddress b = saddress(address(1));

        // Implicit conversion from address to saddress should fail
        saddress c = a;

        // Implicit conversion from saddress to address should fail
        address d = b;
    }
}
// ----
// TypeError 9574: (201-215): Type address is not implicitly convertible to expected type saddress.
// TypeError 9574: (294-307): Type saddress is not implicitly convertible to expected type address.
