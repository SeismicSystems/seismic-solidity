contract C {
    // (2**3)**4 = 4096
    // 2**(3**4) = 2417851639229258349412352
    function test_hardcode1(suint a, suint b, suint c) public returns (suint256) {
        return a**b**c;
    }

    // (3**2)**2)**2 = 6561
    // 3**(2**(2**2) = 43046721
    function test_hardcode2(suint a, suint b, suint c, suint d) public returns (suint256) {
        return a**b**c**d;
    }

    function test_invariant(suint a, suint b, suint c) public returns (bool) {
        return a**b**c == a**(b**c);
    }

    function test_literal_mix(suint a, suint b) public returns (bool) {
        return
            (a**2**b == a**(2**b)) &&
            (2**a**b == 2**(a**b)) &&
            (a**b**2 == a**(b**2));
    }

    function test_other_operators(suint a, suint b) public returns (bool) {
        return
            (a**b/25 == (a**b)/25) &&
            (a**b*3**b == (a**b)*(3**b)) &&
            (b**a**a/b**a**b == (b**(a**a))/(b**(a**b)));
     }
}
// ----
// test_hardcode1(suint256,suint256,suint256): 2, 3, 4 -> 2417851639229258349412352
// test_hardcode2(suint256,suint256,suint256,suint256): 3, 2, 2, 2 -> 43046721
// test_invariant(suint256,suint256,suint256): 2, 3, 4 -> true
// test_invariant(suint256,suint256,suint256): 3, 4, 2 -> true
// test_literal_mix(suint256,suint256): 2, 3 -> true
// test_other_operators(suint256,suint256): 2, 4 -> true

