contract Foo {
    function changeIt() public { x = 9; }
    suint constant x = 56;
    suint immutable y = 78;
}
// ----
// DeclarationError 7491: (61-82): Shielded objects cannot be set to constant or immutable.
// DeclarationError 7491: (61-82): Shielded objects cannot be set to constant or immutable.