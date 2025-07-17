contract C {
    function test() internal pure {
        // Test sbytes arrays
        sbytes1[3] memory arr1;
        sbytes8[5] memory arr8;
        sbytes32[2] memory arr32;
        
        // Test array assignments
        arr1[suint256(0)] = sbytes1(0x01);
        arr8[suint256(1)] = sbytes8(0x0102030405060708);
        arr32[suint256(0)] = sbytes32(0x0102030405060708091011121314151617181920212223242526272829303132);

        // Test array access
        sbytes1 val1 = arr1[suint256(0)];
        sbytes8 val8 = arr8[suint256(1)];
        sbytes32 val32 = arr32[suint256(0)];

        // Test dynamic arrays
        sbytes1[] memory dynArr1 = new sbytes1[](suint256(0));
        sbytes8[] memory dynArr8 = new sbytes8[](suint256(2));
        //sbytes32[] memory dynArr32 = new sbytes32[](suint256(1));
        //
        //dynArr1[0] = sbytes1(0xFF);
        //dynArr8[0] = sbytes8(0xFFFFFFFFFFFFFFFF);
        //dynArr32[0] = sbytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    }
}
// ----
// Warning 2072: (465-477): Unused local variable.
// Warning 2072: (507-519): Unused local variable.
// Warning 2072: (549-563): Unused local variable.
// Warning 2072: (626-650): Unused local variable.
// Warning 2072: (689-713): Unused local variable.