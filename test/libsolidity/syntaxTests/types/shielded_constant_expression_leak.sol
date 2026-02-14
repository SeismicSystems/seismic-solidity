contract C {
    function f() public pure {
        // BinaryOperation folding to RationalNumber → shielded integer
        sint a;
        a = sint(0 ** 1E1233);
        a = sint(1 ** 1E1233);
        a = sint(2 + 3);
        a = sint(10 - 7);
        a = sint(2 * 3);

        // UnaryOperation folding to RationalNumber → shielded integer
        a = sint(-1 ** 1E1233);
        a = sint(-(2 + 3));

        // Parenthesised literal → shielded integer (still a Literal node)
        a = sint(42);

        // Direct literal → shielded integer (baseline)
        a = sint(0E123456789);

        // BinaryOperation → shielded unsigned integer
        suint b;
        b = suint(2 + 3);
        b = suint(10 * 20);

        // BinaryOperation → shielded fixed bytes
        sbytes32 c;
        c = sbytes32(2 + 3);
        c = sbytes32(0xff * 2);
    }
}
// ----
// Warning 9660: (146-163): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (177-194): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (208-219): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (233-245): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (259-270): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (358-376): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (390-404): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (496-504): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (577-594): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (683-695): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (709-723): Literals converted to shielded integers will leak during contract deployment.
// Warning 9663: (810-825): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (839-857): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
