contract C {
    function test() public pure {
        string memory s = "hello";
        sstring memory ss = sstring(s);
        string memory s2 = string(ss);
        
        // Implicit conversion should fail
        sstring memory ss2 = s;
        string memory s3 = ss;
    }
}
// ----
// TypeError 9574: (221-243): Type string memory is not implicitly convertible to expected type sstring memory.
// TypeError 9574: (253-274): Type sstring memory is not implicitly convertible to expected type string memory.