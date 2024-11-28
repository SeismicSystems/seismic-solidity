contract C {
    function (saddress payable) view internal returns (address payable) f;
    function g(function (saddress payable) payable external returns (address payable)) public payable returns (function (saddress payable) payable external returns (address payable)) {
        function (saddress payable) payable external returns (address payable) h; h;
    }
}
// ----
// Warning 6321: (199-270): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
