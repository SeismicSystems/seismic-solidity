contract C {
    function f(saddress) external pure {}
    function f(saddress payable) external pure {}

}
// ----
// TypeError 9914: (58-102): Function overload clash during conversion to external types for arguments.
