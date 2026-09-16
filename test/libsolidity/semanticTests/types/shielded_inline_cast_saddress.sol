// Test inline address(saddress) casts from all container types.
contract C {
    saddress private plain;
    mapping(uint256 => saddress) m;
    saddress[] arr;
    struct S { saddress a; }
    S private s;
    mapping(uint256 => S) sm;

    function store() public {
        plain = saddress(address(0xBEEF));
        m[0] = saddress(address(0xBEEF));
        arr.push(saddress(address(0xBEEF)));
        s.a = saddress(address(0xBEEF));
        sm[0].a = saddress(address(0xBEEF));
    }

    // --- Plain ---
    function plainInline() public view returns (address) { return address(plain); }
    function plainTwoStep() public view returns (address) { saddress v = plain; return address(v); }

    // --- Mapping ---
    function mapInline() public view returns (address) { return address(m[0]); }
    function mapInlineAssigned() public view returns (address) { address v = address(m[0]); return v; }
    function mapTwoStep() public view returns (address) { saddress v = m[0]; return address(v); }

    // --- Array ---
    function arrInline() public view returns (address) { return address(arr[0]); }
    function arrTwoStep() public view returns (address) { saddress v = arr[0]; return address(v); }

    // --- Struct ---
    function structInline() public view returns (address) { return address(s.a); }
    function structTwoStep() public view returns (address) { saddress v = s.a; return address(v); }

    // --- Mapping of struct ---
    function mapStructInline() public view returns (address) { return address(sm[0].a); }
    function mapStructTwoStep() public view returns (address) { saddress v = sm[0].a; return address(v); }
}
// ----
// store() ->
// plainTwoStep() -> 0xbeef
// plainInline() -> 0xbeef
// mapTwoStep() -> 0xbeef
// mapInline() -> 0xbeef
// mapInlineAssigned() -> 0xbeef
// arrTwoStep() -> 0xbeef
// arrInline() -> 0xbeef
// structTwoStep() -> 0xbeef
// structInline() -> 0xbeef
// mapStructTwoStep() -> 0xbeef
// mapStructInline() -> 0xbeef
