contract C {
    sbytes[] dynamicArray;
    sbytes[5] fixedArray;
    
    function test() public view {
        sbytes[] memory memDynamic;
        sbytes[2] memory memFixed;
        
        sbytes[] storage storDynamic = dynamicArray;
        sbytes[5] storage storFixed = fixedArray;
    }
}
// ----
// Warning 2072: (113-139): Unused local variable.
// Warning 2072: (149-174): Unused local variable.
// Warning 2072: (193-221): Unused local variable.
// Warning 2072: (246-273): Unused local variable.