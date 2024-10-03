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
// TypeError 9640: (82-92): Explicit type conversion not allowed from "type(contract C)" to "saddress".
// TypeError 9640: (102-112): Explicit type conversion not allowed from "type(contract I)" to "saddress".
// TypeError 9640: (166-182): Explicit type conversion not allowed from "type(contract C)" to "saddress".
// TypeError 9640: (192-208): Explicit type conversion not allowed from "type(contract I)" to "saddress".
// TypeError 9640: (218-234): Explicit type conversion not allowed from "type(library L)" to "saddress".
