contract C {
    sint8 private a;
    sint16 private b;
    sint32 private c;
    sint64 private d;
    sint128 private e;
    sint256 private f;

    function test() internal {
        // Test max positive for each width
        a = 127s;
        b = 32767s;
        c = 2147483647s;
        d = 9223372036854775807s;
        e = 170141183460469231731687303715884105727s;
        f = 57896044618658097711785492504343953926634992332820282019728792003956564819967s;
        // Test min negative for each width
        a = -128s;
        b = -32768s;
        c = -2147483648s;
        d = -9223372036854775808s;
        e = -170141183460469231731687303715884105728s;
        f = -57896044618658097711785492504343953926634992332820282019728792003956564819968s;
    }
}
// ----
// Warning 9660: (234-238): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (252-258): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (272-283): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (297-317): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (331-371): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (385-463): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (522-526): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (541-547): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (562-573): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (588-608): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (623-663): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
// Warning 9660: (678-756): Shielded number literals are converted to shielded integers whose values will be visible in contract creation code during deployment.
