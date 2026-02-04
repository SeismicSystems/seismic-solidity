contract C {
    saddress a;
    function f() internal pure returns(sbool) {
        a = saddress(0) + saddress(0);
        a = saddress(0) - saddress(0);
        a = saddress(0) * saddress(0);
        a = saddress(0) / saddress(0);
        return saddress(0) == saddress(0);
    }
}
// ----
// TypeError 2271: (89-114): Built-in binary operator + cannot be applied to types saddress and saddress. Arithmetic operations on addresses are not supported. Convert to integer first before using them.
// TypeError 2271: (128-153): Built-in binary operator - cannot be applied to types saddress and saddress. Arithmetic operations on addresses are not supported. Convert to integer first before using them.
// TypeError 2271: (167-192): Built-in binary operator * cannot be applied to types saddress and saddress. Arithmetic operations on addresses are not supported. Convert to integer first before using them.
// TypeError 2271: (206-231): Built-in binary operator / cannot be applied to types saddress and saddress. Arithmetic operations on addresses are not supported. Convert to integer first before using them.
