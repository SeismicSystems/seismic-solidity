pragma abicoder               v2;

// Memory to storage and back with deeply nested mixed structs
contract C {
    struct Leaf {
        suint64 secret;
        uint64 tag;
    }
    struct Branch {
        uint256 id;
        Leaf left;
        Leaf right;
        sbool active;
    }
    struct Root {
        Branch b1;
        Branch b2;
        uint256 version;
    }

    Root r;

    function setFromMemory() public {
        Root memory m = Root(
            Branch(1, Leaf(suint64(10), 11), Leaf(suint64(12), 13), sbool(true)),
            Branch(2, Leaf(suint64(20), 21), Leaf(suint64(22), 23), sbool(false)),
            42
        );
        r = m;
    }

    function readBranch1() public returns (
        uint256 id, uint64 ls, uint64 lt, uint64 rs, uint64 rt, bool a
    ) {
        id = r.b1.id;
        ls = uint64(r.b1.left.secret);
        lt = r.b1.left.tag;
        rs = uint64(r.b1.right.secret);
        rt = r.b1.right.tag;
        a = bool(r.b1.active);
    }

    function readBranch2() public returns (
        uint256 id, uint64 ls, uint64 lt, uint64 rs, uint64 rt, bool a
    ) {
        id = r.b2.id;
        ls = uint64(r.b2.left.secret);
        lt = r.b2.left.tag;
        rs = uint64(r.b2.right.secret);
        rt = r.b2.right.tag;
        a = bool(r.b2.active);
    }

    function readVersion() public returns (uint256) {
        return r.version;
    }

    function toMemoryAndBack() public returns (
        uint256 b1id, uint64 b1ls, uint64 b1lt
    ) {
        Root memory m = r;
        m.b1.left.secret = suint64(999);
        m.b1.left.tag = 111;
        r.b1 = m.b1;
        b1id = r.b1.id;
        b1ls = uint64(r.b1.left.secret);
        b1lt = r.b1.left.tag;
    }
}
// ----
// setFromMemory() ->
// readBranch1() -> 1, 10, 11, 12, 13, true
// readBranch2() -> 2, 20, 21, 22, 23, false
// readVersion() -> 42
// toMemoryAndBack() -> 1, 999, 111
