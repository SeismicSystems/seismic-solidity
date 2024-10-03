contract C {
    function f() public pure returns (saddress) {
        return saddress(-1);
    }
    function g() public pure returns (saddress) {
        return -1;
    }
	function h() public pure returns (saddress) {
		return saddress(2**160);
	}
}
// ----
// TypeError 9640: (77-88): Explicit type conversion not allowed from "int_const -1" to "saddress".
// TypeError 6359: (160-162): Return argument type int_const -1 is not implicitly convertible to expected type (type of first return variable) saddress.
// TypeError 9640: (225-240): Explicit type conversion not allowed from "int_const 1461...(41 digits omitted)...2976" to "saddress".
