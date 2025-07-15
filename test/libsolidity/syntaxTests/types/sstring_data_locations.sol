contract C {
    sstring data1;
    
    function test() public view {
        // Valid assignments
        sstring memory mem1 = sstring(data1);
        
        // Invalid assignments - mixing locations
        sstring storage stor1 = sstring("hello");
        sstring memory mem2 = data1;
    }
}
// ----
// TypeError 9574: (213-253): Type sstring memory is not implicitly convertible to expected type sstring storage pointer.