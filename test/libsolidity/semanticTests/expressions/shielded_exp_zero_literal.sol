contract test {
    function f() public returns(uint) {
        suint d = suint(0) ** suint(0);
        return uint(d);
    }
}
// ----
// f() -> 1
