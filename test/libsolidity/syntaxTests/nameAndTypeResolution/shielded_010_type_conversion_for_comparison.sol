contract test {
    function f() public { suint32(2) == suint64(2); }
}
// ----
// Warning 6133: (42-66): Statement has no effect.
// Warning 2018: (20-69): Function state mutability can be restricted to pure
