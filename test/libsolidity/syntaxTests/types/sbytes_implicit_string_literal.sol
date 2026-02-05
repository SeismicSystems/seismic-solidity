contract C {
    function test() internal pure {
        // Implicit string literal to sbytesN should fail
        sbytes1 a = "a";
        sbytes4 b = "abcd";
        sbytes32 c = "hello";

        // Implicit string literal to bytesN should still work
        bytes1 d = "a";
        bytes4 e = "abcd";
    }
}
// ----
// TypeError 9574: (115-130): Type literal_string "a" is not implicitly convertible to expected type sbytes1.
// TypeError 9574: (140-158): Type literal_string "abcd" is not implicitly convertible to expected type sbytes4.
// TypeError 9574: (168-188): Type literal_string "hello" is not implicitly convertible to expected type sbytes32.
