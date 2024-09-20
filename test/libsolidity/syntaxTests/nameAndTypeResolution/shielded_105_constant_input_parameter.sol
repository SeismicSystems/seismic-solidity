contract test {
    function f(suint[] memory constant a) public { }
}
// ----
// DeclarationError 1788: (31-56): The "constant" keyword can only be used for state variables or variables at file level.
// TypeError 9259: (31-56): Only constants of value type and byte array type are implemented.
