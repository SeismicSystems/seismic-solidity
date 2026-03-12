contract C {
    suint8 private a;
    suint16 private b;
    suint32 private c;
    suint64 private d;
    suint128 private e;

    function test() internal {
        // One more than max for each width
        a = 256s;
        b = 65536s;
        c = 4294967296s;
        d = 18446744073709551616s;
        e = 340282366920938463463374607431768211456s;
    }
}
// ----
// Warning 9667: (216-220): Shielded number literals will leak during contract deployment.
// TypeError 7407: (216-220): Type shielded_int_const 256 is not implicitly convertible to expected type suint8. Literal is too large to fit in suint8.
// Warning 9667: (234-240): Shielded number literals will leak during contract deployment.
// TypeError 7407: (234-240): Type shielded_int_const 65536 is not implicitly convertible to expected type suint16. Literal is too large to fit in suint16.
// Warning 9667: (254-265): Shielded number literals will leak during contract deployment.
// TypeError 7407: (254-265): Type shielded_int_const 4294967296 is not implicitly convertible to expected type suint32. Literal is too large to fit in suint32.
// Warning 9667: (279-300): Shielded number literals will leak during contract deployment.
// TypeError 7407: (279-300): Type shielded_int_const 18446744073709551616 is not implicitly convertible to expected type suint64. Literal is too large to fit in suint64.
// Warning 9667: (314-354): Shielded number literals will leak during contract deployment.
// TypeError 7407: (314-354): Type shielded_int_const 3402...(31 digits omitted)...1456 is not implicitly convertible to expected type suint128. Literal is too large to fit in suint128.
