contract test {
    function f(suint x) pure public {
        suint y = +x;
        y;
    }
}
// ----
// ParserError 9636: (72-73): Use of unary + is disallowed.
