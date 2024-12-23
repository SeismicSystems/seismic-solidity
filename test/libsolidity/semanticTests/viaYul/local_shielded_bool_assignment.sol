contract C {
    function f(sbool a) public pure returns (bool x) {
        sbool b = a;
        x = bool(b);
    }
}
// ----
// f(sbool): true -> true

