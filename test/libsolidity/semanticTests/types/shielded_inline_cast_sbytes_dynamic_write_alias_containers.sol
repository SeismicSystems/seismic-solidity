// Storage aliases created from different sbytes containers must preserve shielded storage ops.
contract C {
    mapping(uint256 => sbytes) m;
    sbytes[] arr;
    struct S { sbytes data; }
    S private s;
    mapping(uint256 => S) sm;
    mapping(uint256 => mapping(uint256 => sbytes)) nested;

    function setup() public {
        m[0].push(sbytes1(0x11));
        m[0].push(sbytes1(0x22));

        arr.push();
        arr[0].push(sbytes1(0xAA));
        arr[0].push(sbytes1(0xBB));
        arr[0].push(sbytes1(0xCC));

        s.data.push(sbytes1(0xF0));
        s.data.push(sbytes1(0x0D));

        sm[0].data.push(sbytes1(0xCA));
        sm[0].data.push(sbytes1(0xFE));

        nested[0][1].push(sbytes1(0xBE));
        nested[0][1].push(sbytes1(0xEF));
    }

    function mapPush() public {
        bytes storage ref = bytes(m[0]);
        ref.push(0x33);
    }

    function arrIndexWrite() public {
        bytes storage ref = bytes(arr[0]);
        ref[1] = 0xDD;
    }

    function structPop() public {
        bytes storage ref = bytes(s.data);
        ref.pop();
    }

    function mapStructPop() public {
        bytes storage ref = bytes(sm[0].data);
        ref.pop();
    }

    function nestedPush() public {
        bytes storage ref = bytes(nested[0][1]);
        ref.push(0xAA);
    }

    function readMap() public view returns (bytes memory) {
        sbytes memory v = m[0];
        return bytes(v);
    }

    function readArr() public view returns (bytes memory) {
        sbytes memory v = arr[0];
        return bytes(v);
    }

    function readStruct() public view returns (bytes memory) {
        sbytes memory v = s.data;
        return bytes(v);
    }

    function readMapStruct() public view returns (bytes memory) {
        sbytes memory v = sm[0].data;
        return bytes(v);
    }

    function readNested() public view returns (bytes memory) {
        sbytes memory v = nested[0][1];
        return bytes(v);
    }
}
// ----
// setup() ->
// readMap() -> 0x20, 2, left(0x1122)
// readArr() -> 0x20, 3, left(0xaabbcc)
// readStruct() -> 0x20, 2, left(0xf00d)
// readMapStruct() -> 0x20, 2, left(0xcafe)
// readNested() -> 0x20, 2, left(0xbeef)
// mapPush() ->
// readMap() -> 0x20, 3, left(0x112233)
// arrIndexWrite() ->
// readArr() -> 0x20, 3, left(0xaaddcc)
// structPop() ->
// readStruct() -> 0x20, 1, left(0xf0)
// mapStructPop() ->
// readMapStruct() -> 0x20, 1, left(0xca)
// nestedPush() ->
// readNested() -> 0x20, 3, left(0xbeefaa)
