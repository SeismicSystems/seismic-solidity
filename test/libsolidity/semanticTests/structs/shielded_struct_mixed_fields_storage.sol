// Struct with mixed shielded and unshielded fields in storage
contract C {
    struct Mixed {
        uint256 id;
        suint256 secret;
        uint8 flags;
        sbool hidden;
        address owner;
        suint128 amount;
    }

    Mixed data;

    function set() public {
        data.id = 42;
        data.secret = suint256(12345);
        data.flags = 0xff;
        data.hidden = sbool(true);
        data.owner = address(0x1234567890123456789012345678901234567890);
        data.amount = suint128(999);
    }

    function get() public returns (
        uint256 id, uint256 secret, uint8 flags,
        bool hidden, address owner, uint128 amount
    ) {
        id = data.id;
        secret = uint256(data.secret);
        flags = data.flags;
        hidden = bool(data.hidden);
        owner = data.owner;
        amount = uint128(data.amount);
    }

    function deleteAndCheck() public returns (
        uint256 id, uint256 secret, uint8 flags,
        bool hidden, address owner, uint128 amount
    ) {
        set();
        delete data;
        id = data.id;
        secret = uint256(data.secret);
        flags = data.flags;
        hidden = bool(data.hidden);
        owner = data.owner;
        amount = uint128(data.amount);
    }
}
// ----
// get() -> 0, 0, 0, false, 0, 0
// set() ->
// get() -> 42, 12345, 0xff, true, 0x1234567890123456789012345678901234567890, 999
// deleteAndCheck() -> 0, 0, 0, false, 0, 0
