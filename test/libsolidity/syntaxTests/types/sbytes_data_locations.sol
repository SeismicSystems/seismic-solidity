contract C {
    sbytes data1;
    
    function test() public view {
        // Valid assignments
        sbytes memory mem1 = sbytes(data1);
        
        // Invalid assignments - mixing locations
        sbytes storage stor1 = sbytes("hello");
        sbytes memory mem2 = data1;
    }
}
// ----
// TypeError 9574: (210-248): Type sbytes memory is not implicitly convertible to expected type sbytes storage pointer.