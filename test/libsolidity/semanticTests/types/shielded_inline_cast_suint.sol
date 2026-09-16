// Test inline uint(suint) casts from all container types.
contract C {
    suint256 private plain256;
    suint8 private plain8;
    mapping(uint256 => suint256) m256;
    mapping(uint256 => suint8) m8;
    suint256[] arr256;
    suint8[] arr8;
    struct S { suint256 u256; suint8 u8; }
    S private s;
    mapping(uint256 => S) sm;

    function store() public {
        plain256 = suint256(42);
        plain8 = suint8(255);
        m256[0] = suint256(42);
        m8[0] = suint8(255);
        arr256.push(suint256(42));
        arr8.push(suint8(255));
        s.u256 = suint256(42);
        s.u8 = suint8(255);
        sm[0].u256 = suint256(42);
        sm[0].u8 = suint8(255);
    }

    // --- Plain ---
    function plainInline256() public view returns (uint256) { return uint256(plain256); }
    function plainTwoStep256() public view returns (uint256) { suint256 v = plain256; return uint256(v); }
    function plainInline8() public view returns (uint8) { return uint8(plain8); }
    function plainTwoStep8() public view returns (uint8) { suint8 v = plain8; return uint8(v); }

    // --- Mapping ---
    function mapInline256() public view returns (uint256) { return uint256(m256[0]); }
    function mapInlineAssigned256() public view returns (uint256) { uint256 v = uint256(m256[0]); return v; }
    function mapTwoStep256() public view returns (uint256) { suint256 v = m256[0]; return uint256(v); }
    function mapInline8() public view returns (uint8) { return uint8(m8[0]); }
    function mapInlineAssigned8() public view returns (uint8) { uint8 v = uint8(m8[0]); return v; }
    function mapTwoStep8() public view returns (uint8) { suint8 v = m8[0]; return uint8(v); }

    // --- Array ---
    function arrInline256() public view returns (uint256) { return uint256(arr256[0]); }
    function arrTwoStep256() public view returns (uint256) { suint256 v = arr256[0]; return uint256(v); }
    function arrInline8() public view returns (uint8) { return uint8(arr8[0]); }
    function arrTwoStep8() public view returns (uint8) { suint8 v = arr8[0]; return uint8(v); }

    // --- Struct ---
    function structInline256() public view returns (uint256) { return uint256(s.u256); }
    function structTwoStep256() public view returns (uint256) { suint256 v = s.u256; return uint256(v); }
    function structInline8() public view returns (uint8) { return uint8(s.u8); }
    function structTwoStep8() public view returns (uint8) { suint8 v = s.u8; return uint8(v); }

    // --- Mapping of struct ---
    function mapStructInline256() public view returns (uint256) { return uint256(sm[0].u256); }
    function mapStructTwoStep256() public view returns (uint256) { suint256 v = sm[0].u256; return uint256(v); }
    function mapStructInline8() public view returns (uint8) { return uint8(sm[0].u8); }
    function mapStructTwoStep8() public view returns (uint8) { suint8 v = sm[0].u8; return uint8(v); }
}
// ----
// store() ->
// plainTwoStep256() -> 42
// plainInline256() -> 42
// plainTwoStep8() -> 255
// plainInline8() -> 255
// mapTwoStep256() -> 42
// mapInline256() -> 42
// mapInlineAssigned256() -> 42
// mapTwoStep8() -> 255
// mapInline8() -> 255
// mapInlineAssigned8() -> 255
// arrTwoStep256() -> 42
// arrInline256() -> 42
// arrTwoStep8() -> 255
// arrInline8() -> 255
// structTwoStep256() -> 42
// structInline256() -> 42
// structTwoStep8() -> 255
// structInline8() -> 255
// mapStructTwoStep256() -> 42
// mapStructInline256() -> 42
// mapStructTwoStep8() -> 255
// mapStructInline8() -> 255
