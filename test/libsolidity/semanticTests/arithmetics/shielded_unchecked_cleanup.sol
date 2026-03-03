// Tests that shielded integer operands are cleaned up in unchecked arithmetic
// operations (div, mod, exp), matching the behavior of regular integers.
contract C {
    uint8 uA;
    uint256 pad1;
    uint8 uB;
    suint8 sA;
    uint256 pad2;
    suint8 sB;

    // Division: raw values 0x0102 / 0x0101 should produce 2 / 1 = 2 after cleanup
    function testDiv() public returns (uint, uint) {
        assembly {
            sstore(uA.slot, 0x0102)
            sstore(uB.slot, 0x0101)
            cstore(sA.slot, 0x0102)
            cstore(sB.slot, 0x0101)
        }
        unchecked {
            return (uint(uA / uB), uint(sA / sB));
        }
    }

    // Modulo: raw values 0x0105 % 0x0103 should produce 5 % 3 = 2 after cleanup
    function testMod() public returns (uint, uint) {
        assembly {
            sstore(uA.slot, 0x0105)
            sstore(uB.slot, 0x0103)
            cstore(sA.slot, 0x0105)
            cstore(sB.slot, 0x0103)
        }
        unchecked {
            return (uint(uA % uB), uint(sA % sB));
        }
    }

    // Exponentiation: 0**0 = 1, but 0**0x100 = 0 if not cleaned
    function testExp() public returns (uint, uint) {
        assembly {
            sstore(uA.slot, 0x0100)  // cleaned: 0, raw: 256
            sstore(uB.slot, 0x0100)  // cleaned: 0, raw: 256
            cstore(sA.slot, 0x0100)
            cstore(sB.slot, 0x0100)
        }
        unchecked {
            return (uint(uA ** uB), uint(sA ** sB));
        }
    }

    // Edge case: smaller values to ensure cleanup is correct
    function testDivSmall() public returns (uint, uint) {
        assembly {
            sstore(uA.slot, 0xff06)  // cleaned: 6
            sstore(uB.slot, 0xff02)  // cleaned: 2
            cstore(sA.slot, 0xff06)
            cstore(sB.slot, 0xff02)
        }
        unchecked {
            return (uint(uA / uB), uint(sA / sB));
        }
    }
}
// ----
// testDiv() -> 2, 2
// testMod() -> 2, 2
// testExp() -> 1, 1
// testDivSmall() -> 3, 3
