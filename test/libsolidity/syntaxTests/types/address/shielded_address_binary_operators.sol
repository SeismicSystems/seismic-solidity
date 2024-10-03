contract C {
    saddress a;
    function f() public pure returns(bool) {
        a = saddress(0) + saddress(0);
        a = saddress(0) - saddress(0);
        a = saddress(0) * saddress(0);
        a = saddress(0) / saddress(0);
        return saddress(0) == saddress(0);
    }
}
// ----
// TypeError 2271: (85-108): Built-in binary operator + cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
// TypeError 2271: (122-145): Built-in binary operator - cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
// TypeError 2271: (159-182): Built-in binary operator * cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
// TypeError 2271: (196-219): Built-in binary operator / cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
