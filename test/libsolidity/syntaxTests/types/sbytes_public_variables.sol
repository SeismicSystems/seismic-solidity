contract C {
    // Test public sbytes variables - should generate getter functions
    sbytes1 public sb1;
    sbytes8 public sb8;
    sbytes32 public sb32;
    
    constructor() {
        sb1 = sbytes1(0x01);
        sb8 = sbytes8(0x0102030405060708);
        sb32 = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);
    }
}

// ----
// TypeError 10101: (88-106): Shielded Types are not supported for public state variables.
// TypeError 10101: (112-130): Shielded Types are not supported for public state variables.
// TypeError 10101: (136-156): Shielded Types are not supported for public state variables.
// Warning 9663: (197-210): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (226-253): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (270-346): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
