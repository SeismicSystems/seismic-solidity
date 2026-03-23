// Test inline int(sint) casts from all container types.
contract C {
    sint256 private plain256;
    sint8 private plain8;
    mapping(uint256 => sint256) m256;
    mapping(uint256 => sint8) m8;
    sint256[] arr256;
    sint8[] arr8;
    struct S { sint256 i256; sint8 i8; }
    S private s;
    mapping(uint256 => S) sm;

    function store() public {
        plain256 = sint256(-9999);
        plain8 = sint8(-1);
        m256[0] = sint256(-9999);
        m8[0] = sint8(-1);
        arr256.push(sint256(-9999));
        arr8.push(sint8(-1));
        s.i256 = sint256(-9999);
        s.i8 = sint8(-1);
        sm[0].i256 = sint256(-9999);
        sm[0].i8 = sint8(-1);
    }

    // --- Plain ---
    function plainInline256() public view returns (int256) { return int256(plain256); }
    function plainTwoStep256() public view returns (int256) { sint256 v = plain256; return int256(v); }
    function plainInline8() public view returns (int8) { return int8(plain8); }
    function plainTwoStep8() public view returns (int8) { sint8 v = plain8; return int8(v); }

    // --- Mapping ---
    function mapInline256() public view returns (int256) { return int256(m256[0]); }
    function mapInlineAssigned256() public view returns (int256) { int256 v = int256(m256[0]); return v; }
    function mapTwoStep256() public view returns (int256) { sint256 v = m256[0]; return int256(v); }
    function mapInline8() public view returns (int8) { return int8(m8[0]); }
    function mapInlineAssigned8() public view returns (int8) { int8 v = int8(m8[0]); return v; }
    function mapTwoStep8() public view returns (int8) { sint8 v = m8[0]; return int8(v); }

    // --- Array ---
    function arrInline256() public view returns (int256) { return int256(arr256[0]); }
    function arrTwoStep256() public view returns (int256) { sint256 v = arr256[0]; return int256(v); }
    function arrInline8() public view returns (int8) { return int8(arr8[0]); }
    function arrTwoStep8() public view returns (int8) { sint8 v = arr8[0]; return int8(v); }

    // --- Struct ---
    function structInline256() public view returns (int256) { return int256(s.i256); }
    function structTwoStep256() public view returns (int256) { sint256 v = s.i256; return int256(v); }
    function structInline8() public view returns (int8) { return int8(s.i8); }
    function structTwoStep8() public view returns (int8) { sint8 v = s.i8; return int8(v); }

    // --- Mapping of struct ---
    function mapStructInline256() public view returns (int256) { return int256(sm[0].i256); }
    function mapStructTwoStep256() public view returns (int256) { sint256 v = sm[0].i256; return int256(v); }
    function mapStructInline8() public view returns (int8) { return int8(sm[0].i8); }
    function mapStructTwoStep8() public view returns (int8) { sint8 v = sm[0].i8; return int8(v); }
}
// ----
// store() ->
// plainTwoStep256() -> -9999
// plainInline256() -> -9999
// plainTwoStep8() -> -1
// plainInline8() -> -1
// mapTwoStep256() -> -9999
// mapInline256() -> -9999
// mapInlineAssigned256() -> -9999
// mapTwoStep8() -> -1
// mapInline8() -> -1
// mapInlineAssigned8() -> -1
// arrTwoStep256() -> -9999
// arrInline256() -> -9999
// arrTwoStep8() -> -1
// arrInline8() -> -1
// structTwoStep256() -> -9999
// structInline256() -> -9999
// structTwoStep8() -> -1
// structInline8() -> -1
// mapStructTwoStep256() -> -9999
// mapStructInline256() -> -9999
// mapStructTwoStep8() -> -1
// mapStructInline8() -> -1
