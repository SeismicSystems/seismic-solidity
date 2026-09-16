contract test {
    function f() public returns(uint) {
        suint d = suint(2) ** suint(3);
        return uint(d);
    }
}
// ----
// f() -> 8
