contract C {
    suint160 a;

    function set(suint160 v) external { a = v; }

    function get() external view returns (address) {
        return address(a);
    }
}
// ====
// compileViaYul: also
// ----
// set(suint160): 0xAABBCCDDEEFF11223344556677889900AABBCCDD ->
// get() -> 0xAABBCCDDEEFF11223344556677889900AABBCCDD
