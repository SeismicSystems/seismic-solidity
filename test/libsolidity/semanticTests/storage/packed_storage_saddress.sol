contract C {
    saddress slot_0_a;
    uint8 slot_0_b;
    uint8 slot_1;

    constructor ()
        public
    {
        slot_0_a = saddress(address(this));
        slot_0_b = 8;
        slot_1 = 9;
    }

    function get() public returns (uint256 my_addr, uint16 packed_uints) {
        assembly {
            my_addr := cload(slot_0_a.slot)
            packed_uints := sload(slot_1.slot)
        }
    }

}
// ----
// constructor()
// get() -> 0x822d76f4c4ac0d26e89071fb06f116e7f3fc7a56, 0x0000000000000000000000000000000000000000000000000000000000000908

