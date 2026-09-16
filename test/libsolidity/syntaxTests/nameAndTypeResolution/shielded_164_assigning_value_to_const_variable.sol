contract Foo {
    function changeIt() public { x = 9; y = 10;}
    suint constant x = 56;
    suint immutable y = 78;
}
// ----
// DeclarationError 10104: (68-89): Shielded objects cannot be set to constant or immutable.
// DeclarationError 10104: (95-117): Shielded objects cannot be set to constant or immutable.
