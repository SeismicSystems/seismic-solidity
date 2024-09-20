contract test {
    function f() public { sint32(2) == suint64(2); }
}
// ----
// TypeError 2271: (42-65): Built-in binary operator == cannot be applied to types sint32 and suint64.
