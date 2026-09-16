// Nested structs mixing shielded and unshielded fields
contract C {
    struct Inner {
        suint256 secret;
        uint256 public_val;
    }
    struct Outer {
        uint256 id;
        Inner inner;
        sbool flag;
        uint8 tag;
    }

    Outer data;

    function setAndGet() public returns (
        uint256 id, uint256 secret, uint256 public_val,
        bool flag, uint8 tag
    ) {
        data.id = 1;
        data.inner.secret = suint256(42);
        data.inner.public_val = 100;
        data.flag = sbool(true);
        data.tag = 7;

        id = data.id;
        secret = uint256(data.inner.secret);
        public_val = data.inner.public_val;
        flag = bool(data.flag);
        tag = data.tag;
    }

    function copyViaMemory() public returns (
        uint256 id, uint256 secret, uint256 public_val,
        bool flag, uint8 tag
    ) {
        Outer memory m = data;
        Outer memory n = m;
        id = n.id;
        secret = uint256(n.inner.secret);
        public_val = n.inner.public_val;
        flag = bool(n.flag);
        tag = n.tag;
    }

    function deleteInner() public returns (uint256 secret, uint256 public_val) {
        delete data.inner;
        secret = uint256(data.inner.secret);
        public_val = data.inner.public_val;
    }
}
// ----
// setAndGet() -> 1, 42, 100, true, 7
// copyViaMemory() -> 1, 42, 100, true, 7
// deleteInner() -> 0, 0
