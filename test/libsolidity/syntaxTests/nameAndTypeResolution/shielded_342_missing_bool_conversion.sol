contract test {
    function b(uint a) public {
        sbool(a == 1);
    }
}
// ----
// Warning 2018: (20-76): Function state mutability can be restricted to pure
