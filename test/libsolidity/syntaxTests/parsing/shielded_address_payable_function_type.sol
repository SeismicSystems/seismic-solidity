contract C {
    function (saddress payable) view internal returns (saddress payable) f;
    function g(function (saddress payable) payable external returns (saddress payable)) public payable returns (function (saddress payable) payable external returns (saddress payable)) {
        function (saddress payable) payable external returns (saddress payable) h; h;
    }
}
// ----
// Warning 6321: (201-273): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
