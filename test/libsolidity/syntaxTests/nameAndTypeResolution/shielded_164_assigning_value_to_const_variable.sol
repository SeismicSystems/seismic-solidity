contract Foo {
    function changeIt() public { x = 9; }
    suint constant x = 56;
}
// ----
// DeclarationError 7491: (61-82): Shielded integers cannot be set to constant.
