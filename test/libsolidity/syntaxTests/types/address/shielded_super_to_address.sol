contract C {
    function f() public pure {
        saddress(super);
    }
}
// ----
// TypeError 9640: (52-67): Explicit type conversion not allowed from "type(contract super C)" to "saddress".
