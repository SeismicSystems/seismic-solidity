contract C {
    function f(sbool a) public pure returns (bool x) {
        sbool b = a;
        x = b;
    }
}
// ----
// f(sbool): true -> true

