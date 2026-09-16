contract C {
    saddress private sa;

    function set() public {
        sa = saddress(address(0x1234567890123456789012345678901234567890));
    }

    function get() public view returns (address) {
        return address(sa);
    }

    function del() public {
        delete sa;
    }
}
// ----
// get() -> 0x00
// set() ->
// get() -> 0x1234567890123456789012345678901234567890
// del() ->
// get() -> 0x00
