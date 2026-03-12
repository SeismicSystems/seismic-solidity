contract C {
    sint8 private a;
    sint16 private b;
    sint32 private c;
    sint64 private d;
    sint128 private e;

    function test() internal {
        // One more than max positive for each width
        a = 128s;
        b = 32768s;
        c = 2147483648s;
        d = 9223372036854775808s;
        e = 170141183460469231731687303715884105728s;
        // One less than min negative for each width
        a = -129s;
        b = -32769s;
        c = -2147483649s;
        d = -9223372036854775809s;
        e = -170141183460469231731687303715884105729s;
    }
}
// ----
// Warning 9660: (220-224): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (220-224): Type shielded_int_const 128 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
// Warning 9660: (238-244): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (238-244): Type shielded_int_const 32768 is not implicitly convertible to expected type sint16. Literal is too large to fit in sint16.
// Warning 9660: (258-269): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (258-269): Type shielded_int_const 2147483648 is not implicitly convertible to expected type sint32. Literal is too large to fit in sint32.
// Warning 9660: (283-303): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (283-303): Type shielded_int_const 9223372036854775808 is not implicitly convertible to expected type sint64. Literal is too large to fit in sint64.
// Warning 9660: (317-357): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (317-357): Type shielded_int_const 1701...(31 digits omitted)...5728 is not implicitly convertible to expected type sint128. Literal is too large to fit in sint128.
// Warning 9660: (425-429): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (424-429): Type shielded_int_const -129 is not implicitly convertible to expected type sint8. Literal is too large to fit in sint8.
// Warning 9660: (444-450): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (443-450): Type shielded_int_const -32769 is not implicitly convertible to expected type sint16. Literal is too large to fit in sint16.
// Warning 9660: (465-476): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (464-476): Type shielded_int_const -2147483649 is not implicitly convertible to expected type sint32. Literal is too large to fit in sint32.
// Warning 9660: (491-511): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (490-511): Type shielded_int_const -9223372036854775809 is not implicitly convertible to expected type sint64. Literal is too large to fit in sint64.
// Warning 9660: (526-566): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// TypeError 7407: (525-566): Type shielded_int_const -170...(32 digits omitted)...5729 is not implicitly convertible to expected type sint128. Literal is too large to fit in sint128.
