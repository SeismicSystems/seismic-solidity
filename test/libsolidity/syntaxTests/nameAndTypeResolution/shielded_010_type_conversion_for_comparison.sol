contract test {
    function f() public { suint32(2) == suint64(2); }
}
// ----
// Warning 9660: (42-52): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (56-66): Literals converted to shielded integers will leak during contract deployment.
// Warning 6133: (42-66): Statement has no effect.
// Warning 2018: (20-69): Function state mutability can be restricted to pure
