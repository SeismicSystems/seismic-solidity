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
// TypeError 2271: (86-111): Built-in binary operator + cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
// TypeError 2271: (125-150): Built-in binary operator - cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
// TypeError 2271: (164-189): Built-in binary operator * cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
// TypeError 2271: (203-228): Built-in binary operator / cannot be applied to types saddress and saddress. Arithmetic operations on saddresses are not supported. Convert to integer first before using them.
