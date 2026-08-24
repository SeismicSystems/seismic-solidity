interface I {}

library L {}

contract C {
    function f() public pure {
        saddress(C);
        saddress(I);
        saddress(L); // This one is allowed

        saddress(type(C));
        saddress(type(I));
        saddress(type(L));
    }
}
// ----
// TypeError 9640: (82-93): Explicit type conversion not allowed from "type(contract C)" to "saddress".
// TypeError 9640: (103-114): Explicit type conversion not allowed from "type(contract I)" to "saddress".
// TypeError 9640: (169-186): Explicit type conversion not allowed from "type(contract C)" to "saddress".
// TypeError 9640: (196-213): Explicit type conversion not allowed from "type(contract I)" to "saddress".
// TypeError 9640: (223-240): Explicit type conversion not allowed from "type(library L)" to "saddress".
