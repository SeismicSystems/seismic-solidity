contract C {
    sstring[] dynamicArray;
    sstring[3] fixedArray;
    
    function test() public view {
        sstring[] memory memDynamic;
        sstring[4] memory memFixed;
        
        sstring[] storage storDynamic = dynamicArray;
        sstring[3] storage storFixed = fixedArray;
    }
}
// ----
//  Warning 2072: (115-142): Unused local variable.
//  Warning 2072: (152-178): Unused local variable.
//  Warning 2072: (197-226): Unused local variable.
//  Warning 2072: (251-279): Unused local variable.