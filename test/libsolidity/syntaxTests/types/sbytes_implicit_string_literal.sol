contract C {
    function test() internal pure {
        // Implicit string literal to sbytesN should fail
        sbytes1 a = "a";
        sbytes4 b = "abcd";
        sbytes32 c = "hello";

        // Explicit conversion with too-large literal should fail
        sbytes1 f = sbytes1("ab");
        sbytes4 g = sbytes4("abcde");

        // Implicit string literal to bytesN should still work
        bytes1 d = "a";
        bytes4 e = "abcd";
    }
}
// ----
// TypeError 9574: (115-130): Type literal_string "a" is not implicitly convertible to expected type sbytes1.
// TypeError 9574: (140-158): Type literal_string "abcd" is not implicitly convertible to expected type sbytes4.
// TypeError 9574: (168-188): Type literal_string "hello" is not implicitly convertible to expected type sbytes32.
// TypeError 9640: (277-290): Explicit type conversion not allowed from "literal_string "ab"" to "sbytes1". Literal is larger than the type.
// TypeError 9640: (312-328): Explicit type conversion not allowed from "literal_string "abcde"" to "sbytes4". Literal is larger than the type.
