contract test {
    function f() public { sint32(2) == suint64(2); }
}
// ----
// Warning 10403: (42-51): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (55-65): Literals converted to shielded integers will leak during contract deployment.
// TypeError 2271: (42-65): Built-in binary operator == cannot be applied to types sint32 and suint64.
