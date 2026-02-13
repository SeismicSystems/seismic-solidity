contract C {
    // Test that sbytes cannot be returned from external functions
    function externalSbytes1() external pure returns (sbytes1) {
        return sbytes1(0x01);
    }

    function externalSbytes16() external pure returns (sbytes16) {
        return sbytes16(0x01020304050607080910111213141516);
    }

    function externalSbytes32() external pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }

    // Test that sbytes cannot be returned from public functions
    function publicSbytes1() public pure returns (sbytes1) {
        return sbytes1(0x01);
    }

    function publicSbytes32() public pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }

    // Internal should be allowed
    function internalSbytes32() internal pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }

    // Private should be allowed
    function privateSbytes32() private pure returns (sbytes32) {
        return sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }
}
// ----
// TypeError 7492: (134-141): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9663: (160-173): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// TypeError 7492: (237-245): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9663: (264-308): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// TypeError 7492: (372-380): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9663: (399-475): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// TypeError 7492: (599-606): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9663: (625-638): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// TypeError 7492: (698-706): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// Warning 9663: (725-801): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (926-1002): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (1124-1200): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
