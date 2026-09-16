// Test inline bool(sbool) casts from all container types.
contract C {
    sbool private plain;
    mapping(uint256 => sbool) m;
    sbool[] arr;
    struct S { sbool b; }
    S private s;
    mapping(uint256 => S) sm;

    function store() public {
        plain = sbool(true);
        m[0] = sbool(true);
        arr.push(sbool(true));
        s.b = sbool(true);
        sm[0].b = sbool(true);
    }

    // --- Plain ---
    function plainInline() public view returns (bool) { return bool(plain); }
    function plainTwoStep() public view returns (bool) { sbool v = plain; return bool(v); }

    // --- Mapping ---
    function mapInline() public view returns (bool) { return bool(m[0]); }
    function mapInlineAssigned() public view returns (bool) { bool v = bool(m[0]); return v; }
    function mapTwoStep() public view returns (bool) { sbool v = m[0]; return bool(v); }

    // --- Array ---
    function arrInline() public view returns (bool) { return bool(arr[0]); }
    function arrTwoStep() public view returns (bool) { sbool v = arr[0]; return bool(v); }

    // --- Struct ---
    function structInline() public view returns (bool) { return bool(s.b); }
    function structTwoStep() public view returns (bool) { sbool v = s.b; return bool(v); }

    // --- Mapping of struct ---
    function mapStructInline() public view returns (bool) { return bool(sm[0].b); }
    function mapStructTwoStep() public view returns (bool) { sbool v = sm[0].b; return bool(v); }
}
// ----
// store() ->
// plainTwoStep() -> true
// plainInline() -> true
// mapTwoStep() -> true
// mapInline() -> true
// mapInlineAssigned() -> true
// arrTwoStep() -> true
// arrInline() -> true
// structTwoStep() -> true
// structInline() -> true
// mapStructTwoStep() -> true
// mapStructInline() -> true
