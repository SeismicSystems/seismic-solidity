contract C {
    // (2**3)**4 = 4096
    // 2**(3**4) = 2417851639229258349412352
    function test_hardcode1(suint a, suint b, suint c) public returns (uint256) {
        return uint(a**b**c);
    }

    // (3**2)**2)**2 = 6561
    // 3**(2**(2**2) = 43046721
    function test_hardcode2(suint a, suint b, suint c, suint d) public returns (uint256) {
        return uint(a**b**c**d);
    }

    function test_invariant(suint a, suint b, suint c) public returns (bool) {
        return bool(a**b**c == a**(b**c));
    }

    function test_literal_mix(suint a, suint b) public returns (bool) {
        return
            bool(a**suint(2)**b == a**(suint(2)**b)) &&
            bool(suint(2)**a**b == suint(2)**(a**b)) &&
            bool(a**b**suint(2) == a**(b**suint(2)));
    }

    function test_other_operators(suint a, suint b) public returns (bool) {
        return
            bool(a**b/suint(25) == (a**b)/suint(25)) &&
            bool(a**b*suint(3)**b == (a**b)*(suint(3)**b)) &&
            bool(b**a**a/b**a**b == (b**(a**a))/(b**(a**b)));
    }
}
// ----
// test_hardcode1(suint256,suint256,suint256): 2, 3, 4 -> 2417851639229258349412352
// test_hardcode2(suint256,suint256,suint256,suint256): 3, 2, 2, 2 -> 43046721
// test_invariant(suint256,suint256,suint256): 2, 3, 4 -> true
// test_invariant(suint256,suint256,suint256): 3, 4, 2 -> true
// test_literal_mix(suint256,suint256): 2, 3 -> true
// test_other_operators(suint256,suint256): 2, 4 -> true

