// An external function type cannot carry shielded types in its parameter or return list.
// The ABI encodes a function value as (address, selector) only, so the shielded boundary
// cannot be enforced across it: ordinary returndata could be decoded as a shielded value
// and cstored, or a shielded value passed out as a public callback argument.
contract C {
    sbool private opened;

    function open(function() external returns (sbool) policy) external {
        opened = policy();
    }

    function takesShieldedArg(function(suint256) external cb) external {}

    function() external returns (saddress) stored;
}
// ----
// TypeError 10111: (435-440): Shielded types cannot appear in the parameters or return values of an external function type. The ABI encodes a function value as (address, selector) only and cannot enforce the shielded boundary across it.
// TypeError 10111: (534-542): Shielded types cannot appear in the parameters or return values of an external function type. The ABI encodes a function value as (address, selector) only and cannot enforce the shielded boundary across it.
// TypeError 10111: (603-611): Shielded types cannot appear in the parameters or return values of an external function type. The ABI encodes a function value as (address, selector) only and cannot enforce the shielded boundary across it.
