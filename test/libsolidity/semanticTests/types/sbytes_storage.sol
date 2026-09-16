contract C {
    sbytes1 stored_sb1;
    sbytes8 stored_sb8;
    sbytes32 stored_sb32;

    function set_values() public {
        stored_sb1 = sbytes1(0x01);
        stored_sb8 = sbytes8(0x0102030405060708);
        stored_sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }

    function get_values() private view returns(sbytes1, sbytes8, sbytes32) {
        return (stored_sb1, stored_sb8, stored_sb32);
    }

    function test_storage() public returns(bool) {
        set_values();
        (sbytes1 sb1, sbytes8 sb8, sbytes32 sb32) = get_values();

        require(sb1 == sbytes1(0x01));
        require(sb8 == sbytes8(0x0102030405060708));
        require(sb32 == sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132));

        return true;
    }
}
// ----
// test_storage() -> true
