contract C {
    sbytes1 sb1;
    sbytes2 sb2;
    sbytes3 sb3;
    sbytes4 sb4;
    sbytes8 sb8;
    sbytes16 sb16;
    sbytes20 sb20;
    sbytes32 sb32;
    
    function test() internal pure {
        sbytes1 local1;
        sbytes2 local2;
        sbytes32 local32;
        local1 = sbytes1(0x01);
        local2 = sbytes2(0x0102);
        local32 = sbytes32(0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20);
    }
}
// ----
// Warning 10412: (287-300): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 10412: (319-334): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 10412: (354-430): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
