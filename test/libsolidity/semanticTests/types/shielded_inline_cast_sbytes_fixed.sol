// Test inline bytesN(sbytesN) casts from all container types.
// Covers sbytes1 and sbytes32 as representative fixed-size shielded bytes.
contract C {
    sbytes1 private plain1;
    sbytes32 private plain32;
    mapping(uint256 => sbytes1) m1;
    mapping(uint256 => sbytes32) m32;
    sbytes1[] arr1;
    sbytes32[] arr32;
    struct S { sbytes1 b1; sbytes32 b32; }
    S private s;
    mapping(uint256 => S) sm;

    function store() public {
        plain1 = sbytes1(bytes1(0xAB));
        plain32 = sbytes32(bytes32(uint256(0xDEAD)));
        m1[0] = sbytes1(bytes1(0xAB));
        m32[0] = sbytes32(bytes32(uint256(0xDEAD)));
        arr1.push(sbytes1(bytes1(0xAB)));
        arr32.push(sbytes32(bytes32(uint256(0xDEAD))));
        s.b1 = sbytes1(bytes1(0xAB));
        s.b32 = sbytes32(bytes32(uint256(0xDEAD)));
        sm[0].b1 = sbytes1(bytes1(0xAB));
        sm[0].b32 = sbytes32(bytes32(uint256(0xDEAD)));
    }

    // --- Plain ---
    function plainInline1() public view returns (bytes1) { return bytes1(plain1); }
    function plainTwoStep1() public view returns (bytes1) { sbytes1 v = plain1; return bytes1(v); }
    function plainInline32() public view returns (bytes32) { return bytes32(plain32); }
    function plainTwoStep32() public view returns (bytes32) { sbytes32 v = plain32; return bytes32(v); }

    // --- Mapping ---
    function mapInline1() public view returns (bytes1) { return bytes1(m1[0]); }
    function mapInlineAssigned1() public view returns (bytes1) { bytes1 v = bytes1(m1[0]); return v; }
    function mapTwoStep1() public view returns (bytes1) { sbytes1 v = m1[0]; return bytes1(v); }
    function mapInline32() public view returns (bytes32) { return bytes32(m32[0]); }
    function mapInlineAssigned32() public view returns (bytes32) { bytes32 v = bytes32(m32[0]); return v; }
    function mapTwoStep32() public view returns (bytes32) { sbytes32 v = m32[0]; return bytes32(v); }

    // --- Array ---
    function arrInline1() public view returns (bytes1) { return bytes1(arr1[0]); }
    function arrTwoStep1() public view returns (bytes1) { sbytes1 v = arr1[0]; return bytes1(v); }
    function arrInline32() public view returns (bytes32) { return bytes32(arr32[0]); }
    function arrTwoStep32() public view returns (bytes32) { sbytes32 v = arr32[0]; return bytes32(v); }

    // --- Struct ---
    function structInline1() public view returns (bytes1) { return bytes1(s.b1); }
    function structTwoStep1() public view returns (bytes1) { sbytes1 v = s.b1; return bytes1(v); }
    function structInline32() public view returns (bytes32) { return bytes32(s.b32); }
    function structTwoStep32() public view returns (bytes32) { sbytes32 v = s.b32; return bytes32(v); }

    // --- Mapping of struct ---
    function mapStructInline1() public view returns (bytes1) { return bytes1(sm[0].b1); }
    function mapStructTwoStep1() public view returns (bytes1) { sbytes1 v = sm[0].b1; return bytes1(v); }
    function mapStructInline32() public view returns (bytes32) { return bytes32(sm[0].b32); }
    function mapStructTwoStep32() public view returns (bytes32) { sbytes32 v = sm[0].b32; return bytes32(v); }
}
// ----
// store() ->
// plainTwoStep1() -> left(0xab)
// plainInline1() -> left(0xab)
// plainTwoStep32() -> 0xdead
// plainInline32() -> 0xdead
// mapTwoStep1() -> left(0xab)
// mapInline1() -> left(0xab)
// mapInlineAssigned1() -> left(0xab)
// mapTwoStep32() -> 0xdead
// mapInline32() -> 0xdead
// mapInlineAssigned32() -> 0xdead
// arrTwoStep1() -> left(0xab)
// arrInline1() -> left(0xab)
// arrTwoStep32() -> 0xdead
// arrInline32() -> 0xdead
// structTwoStep1() -> left(0xab)
// structInline1() -> left(0xab)
// structTwoStep32() -> 0xdead
// structInline32() -> 0xdead
// mapStructTwoStep1() -> left(0xab)
// mapStructInline1() -> left(0xab)
// mapStructTwoStep32() -> 0xdead
// mapStructInline32() -> 0xdead
