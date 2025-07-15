contract C {
    function test() public pure {
        bytes memory b = "hello";
        sbytes memory sb = sbytes(b);
        bytes memory b2 = bytes(sb);
        
        // Implicit conversion should fail
        sbytes memory sb2 = b;
        bytes memory b3 = sb;
    }
}
// ----
// TypeError 9574: (216-237): Type bytes memory is not implicitly convertible to expected type sbytes memory.
// TypeError 9574: (247-267): Type sbytes memory is not implicitly convertible to expected type bytes memory.