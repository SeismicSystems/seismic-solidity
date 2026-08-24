// Internal functions returning a shielded storage ref (sbytes storage) preserve shielded ops
// regardless of definition order; the boundary reveal goes through bytes()/bytes memory.
contract C {
    sbytes private left;
    sbytes private right;
    sbytes private longLeft;
    sbytes private longRight;

    function setup() public {
        left.push(sbytes1(0x11));
        left.push(sbytes1(0x22));

        right.push(sbytes1(0x33));
        right.push(sbytes1(0x44));
        right.push(sbytes1(0x55));

        for (uint256 i = 0; i < 32; ++i)
            longLeft.push(sbytes1(bytes1(uint8(i + 1))));

        for (uint256 i = 0; i < 33; ++i)
            longRight.push(sbytes1(bytes1(uint8(i + 0x31))));
    }

    function pick(bool which) internal view returns (sbytes storage ref) {
        if (which)
            ref = left;
        else
            ref = right;
    }

    function pickTagged(bool which) internal view returns (uint256, sbytes storage ref) {
        if (which)
            return (1, left);
        return (2, right);
    }

    function pickLong(bool which) internal view returns (sbytes storage ref) {
        if (which)
            ref = longLeft;
        else
            ref = longRight;
    }

    function readPick(bool which) public view returns (bytes memory) {
        sbytes storage ref = pick(which);
        return bytes(ref);
    }

    function readPickDirect(bool which) public view returns (bytes memory) {
        return bytes(pick(which));
    }

    function readViaTernary(bool which) public view returns (bytes memory) {
        bytes storage ref = which ? bytes(left) : bytes(right);
        return ref;
    }

    function readViaTernaryAt(bool which, uint256 i) public view returns (bytes1) {
        bytes storage ref = which ? bytes(left) : bytes(right);
        return ref[i];
    }

    function pushPick(bool which, bytes1 value) public {
        sbytes storage ref = pick(which);
        ref.push(sbytes1(value));
    }

    function pushViaTernary(bool which, bytes1 value) public {
        bytes storage ref = which ? bytes(left) : bytes(right);
        ref.push(value);
    }

    function readViaReassignment(bool which) public view returns (bytes memory) {
        bytes storage ref = bytes(left);
        if (!which)
            ref = bytes(right);
        return ref;
    }

    function pushViaReassignment(bool which, bytes1 value) public {
        bytes storage ref = bytes(left);
        if (!which)
            ref = bytes(right);
        ref.push(value);
    }

    function readTaggedTag(bool which) public view returns (uint256) {
        (uint256 tag, ) = pickTagged(which);
        return tag;
    }

    function readTaggedBytes(bool which) public view returns (bytes memory) {
        (, sbytes storage ref) = pickTagged(which);
        return bytes(ref);
    }

    function readPickLong(bool which) public view returns (bytes memory) {
        return bytes(pickLong(which));
    }

    function readPickLongAt(bool which, uint256 i) public view returns (bytes1) {
        sbytes storage ref = pickLong(which);
        return bytes1(ref[i]);
    }

    function pushPickLong(bool which, bytes1 value) public {
        sbytes storage ref = pickLong(which);
        ref.push(sbytes1(value));
    }

    function readDirectLongLeft() public view returns (bytes memory) {
        sbytes memory v = longLeft;
        return bytes(v);
    }

    function readDirectLongRight() public view returns (bytes memory) {
        sbytes memory v = longRight;
        return bytes(v);
    }
}
// ----
// setup() ->
// readPick(bool): true -> 0x20, 2, left(0x1122)
// readPick(bool): false -> 0x20, 3, left(0x334455)
// readPickDirect(bool): true -> 0x20, 2, left(0x1122)
// readPickDirect(bool): false -> 0x20, 3, left(0x334455)
// readViaTernary(bool): true -> 0x20, 2, left(0x1122)
// readViaTernary(bool): false -> 0x20, 3, left(0x334455)
// readViaTernaryAt(bool,uint256): false, 1 -> left(0x44)
// readTaggedTag(bool): true -> 1
// readTaggedTag(bool): false -> 2
// readTaggedBytes(bool): true -> 0x20, 2, left(0x1122)
// readTaggedBytes(bool): false -> 0x20, 3, left(0x334455)
// pushPick(bool,bytes1): true, left(0x99) ->
// readPick(bool): true -> 0x20, 3, left(0x112299)
// pushPick(bool,bytes1): false, left(0x66) ->
// readPick(bool): false -> 0x20, 4, left(0x33445566)
// pushViaTernary(bool,bytes1): true, left(0x77) ->
// readPick(bool): true -> 0x20, 4, left(0x11229977)
// pushViaReassignment(bool,bytes1): false, left(0x88) ->
// readPick(bool): false -> 0x20, 5, left(0x3344556688)
// readViaReassignment(bool): true -> 0x20, 4, left(0x11229977)
// readViaReassignment(bool): false -> 0x20, 5, left(0x3344556688)
// readPickLong(bool): true -> 0x20, 32, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20
// readPickLong(bool): false -> 0x20, 33, 0x3132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f50, left(0x51)
// readPickLongAt(bool,uint256): true, 31 -> left(0x20)
// readPickLongAt(bool,uint256): false, 32 -> left(0x51)
// pushPickLong(bool,bytes1): true, left(0xaa) ->
// readDirectLongLeft() -> 0x20, 33, 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, left(0xaa)
// pushPickLong(bool,bytes1): false, left(0xbb) ->
// readDirectLongRight() -> 0x20, 34, 0x3132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f50, left(0x51bb)
