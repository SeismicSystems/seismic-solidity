contract test {
    fallback() external { suint x = 3; sint y = -4; y ** x; }
    function f() public pure { sint16 x = 3; suint8 y = 4; x ** y; }
    function g() public pure { sint16 x = 3; suint16 y = 4; x ** y; }
}
// ----
