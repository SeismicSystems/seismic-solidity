contract C {
    function f() public pure returns (address) {
        return address(saddress(-1));
    }
    function g() public pure returns (address) {
        return -1;
    }
	function h() public pure returns (address) {
		return address(saddress(2**160));
	}
}
// ----
// TypeError 9640: (85-97): Explicit type conversion not allowed from "int_const -1" to "saddress".
// TypeError 6359: (170-172): Return argument type int_const -1 is not implicitly convertible to expected type (type of first return variable) address.
// TypeError 9640: (243-259): Explicit type conversion not allowed from "int_const 1461...(41 digits omitted)...2976" to "saddress".
