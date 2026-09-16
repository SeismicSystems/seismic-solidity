contract C {
    uint[3] arr;
    function f() external { arr.push(); }
}
// ----
// TypeError 9582: (58-66): Member "push" not found or not visible after argument-dependent lookup in uint256[3] storage ref.
