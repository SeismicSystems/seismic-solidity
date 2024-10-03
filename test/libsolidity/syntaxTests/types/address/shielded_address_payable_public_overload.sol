contract C {
    function f(saddress) public pure {}
    function f(saddress payable) public pure {}

}
// ----
// TypeError 9914: (56-98): Function overload clash during conversion to external types for arguments.
