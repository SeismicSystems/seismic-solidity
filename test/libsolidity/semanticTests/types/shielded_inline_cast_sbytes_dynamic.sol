// Test inline bytes(sbytes) casts for dynamic sbytes from all container types.
// BUG: inline cast generates SLOAD instead of CLOAD, causing InvalidPrivateStorageAccess.
// Two-step (assign to sbytes memory first) works correctly.
contract C {
    sbytes private plain;
    mapping(uint256 => sbytes) m;
    sbytes[] arr;
    struct S { sbytes data; }
    S private s;
    mapping(uint256 => S) sm;
    mapping(uint256 => mapping(uint256 => sbytes)) nested;

    function storePlain() public {
        plain.push(sbytes1(0x11));
        plain.push(sbytes1(0x22));
    }

    function storeMap() public {
        m[0].push(sbytes1(0xDE));
        m[0].push(sbytes1(0xAD));
        m[0].push(sbytes1(0xBE));
        m[0].push(sbytes1(0xEF));
    }

    function storeArr() public {
        arr.push();
        arr[0].push(sbytes1(0xAA));
        arr[0].push(sbytes1(0xBB));
        arr[0].push(sbytes1(0xCC));
    }

    function storeStruct() public {
        s.data.push(sbytes1(0xF0));
        s.data.push(sbytes1(0x0D));
    }

    function storeMapStruct() public {
        sm[0].data.push(sbytes1(0xCA));
        sm[0].data.push(sbytes1(0xFE));
    }

    function storeNested() public {
        nested[0][1].push(sbytes1(0xBE));
        nested[0][1].push(sbytes1(0xEF));
    }

    // --- Plain ---
    function plainInline() public view returns (bytes memory) { return bytes(plain); }
    function plainTwoStep() public view returns (bytes memory) { sbytes memory v = plain; return bytes(v); }
    function plainAliasStorageRead() public view returns (bytes memory) { bytes storage v = bytes(plain); return v; }

    // --- Mapping ---
    function mapInline() public view returns (bytes memory) { return bytes(m[0]); }
    function mapTwoStep() public view returns (bytes memory) { sbytes memory v = m[0]; return bytes(v); }
    function mapAliasStorageRead() public view returns (bytes memory) { bytes storage v = bytes(m[0]); return v; }

    // --- Array ---
    function arrInline() public view returns (bytes memory) { return bytes(arr[0]); }
    function arrTwoStep() public view returns (bytes memory) { sbytes memory v = arr[0]; return bytes(v); }
    function arrAliasStorageRead() public view returns (bytes memory) { bytes storage v = bytes(arr[0]); return v; }

    // --- Struct ---
    function structInline() public view returns (bytes memory) { return bytes(s.data); }
    function structTwoStep() public view returns (bytes memory) { sbytes memory v = s.data; return bytes(v); }
    function structAliasStorageRead() public view returns (bytes memory) { bytes storage v = bytes(s.data); return v; }

    // --- Mapping of struct ---
    function mapStructInline() public view returns (bytes memory) { return bytes(sm[0].data); }
    function mapStructTwoStep() public view returns (bytes memory) { sbytes memory v = sm[0].data; return bytes(v); }
    function mapStructAliasStorageRead() public view returns (bytes memory) { bytes storage v = bytes(sm[0].data); return v; }

    // --- Nested mapping ---
    function nestedInline() public view returns (bytes memory) { return bytes(nested[0][1]); }
    function nestedTwoStep() public view returns (bytes memory) { sbytes memory v = nested[0][1]; return bytes(v); }
    function nestedAliasStorageRead() public view returns (bytes memory) { bytes storage v = bytes(nested[0][1]); return v; }
}
// ----
// storePlain() ->
// plainTwoStep() -> 0x20, 2, left(0x1122)
// plainInline() -> 0x20, 2, left(0x1122)
// plainAliasStorageRead() -> 0x20, 2, left(0x1122)
// storeMap() ->
// mapTwoStep() -> 0x20, 4, left(0xdeadbeef)
// mapInline() -> 0x20, 4, left(0xdeadbeef)
// mapAliasStorageRead() -> 0x20, 4, left(0xdeadbeef)
// storeArr() ->
// arrTwoStep() -> 0x20, 3, left(0xaabbcc)
// arrInline() -> 0x20, 3, left(0xaabbcc)
// arrAliasStorageRead() -> 0x20, 3, left(0xaabbcc)
// storeStruct() ->
// structTwoStep() -> 0x20, 2, left(0xf00d)
// structInline() -> 0x20, 2, left(0xf00d)
// structAliasStorageRead() -> 0x20, 2, left(0xf00d)
// storeMapStruct() ->
// mapStructTwoStep() -> 0x20, 2, left(0xcafe)
// mapStructInline() -> 0x20, 2, left(0xcafe)
// mapStructAliasStorageRead() -> 0x20, 2, left(0xcafe)
// storeNested() ->
// nestedTwoStep() -> 0x20, 2, left(0xbeef)
// nestedInline() -> 0x20, 2, left(0xbeef)
// nestedAliasStorageRead() -> 0x20, 2, left(0xbeef)
