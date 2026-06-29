contract C {
    function (saddress payable) view internal returns (address payable) f;
    function g(function (saddress payable) payable external returns (address payable)) public payable returns (function (saddress payable) payable external returns (address payable)) {
        function (saddress payable) payable external returns (address payable) h; h;
    }
}
// ----
// TypeError 10111: (113-129): Shielded types cannot appear in the parameters or return values of an external function type. The ABI encodes a function value as (address, selector) only and cannot enforce the shielded boundary across it.
// TypeError 10111: (209-225): Shielded types cannot appear in the parameters or return values of an external function type. The ABI encodes a function value as (address, selector) only and cannot enforce the shielded boundary across it.
// TypeError 10111: (291-307): Shielded types cannot appear in the parameters or return values of an external function type. The ABI encodes a function value as (address, selector) only and cannot enforce the shielded boundary across it.
