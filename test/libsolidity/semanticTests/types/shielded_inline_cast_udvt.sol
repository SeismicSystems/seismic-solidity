// Test inline unwrap/cast for user-defined value types wrapping shielded primitives.
type ShieldedUint is suint256;
type ShieldedInt is sint256;
type ShieldedBool is sbool;
type ShieldedAddr is saddress;
type ShieldedB32 is sbytes32;

contract C {
    ShieldedUint private plain;
    mapping(uint256 => ShieldedUint) m;
    ShieldedUint[] arr;
    struct S { ShieldedUint u; ShieldedBool b; ShieldedAddr a; ShieldedB32 b32; }
    S private s;
    mapping(uint256 => S) sm;

    // Also test non-uint UDVTs in mappings
    mapping(uint256 => ShieldedBool) mBool;
    mapping(uint256 => ShieldedAddr) mAddr;
    mapping(uint256 => ShieldedB32) mB32;
    mapping(uint256 => ShieldedInt) mInt;

    function store() public {
        plain = ShieldedUint.wrap(suint256(42));
        m[0] = ShieldedUint.wrap(suint256(42));
        arr.push(ShieldedUint.wrap(suint256(42)));
        s.u = ShieldedUint.wrap(suint256(42));
        s.b = ShieldedBool.wrap(sbool(true));
        s.a = ShieldedAddr.wrap(saddress(address(0xBEEF)));
        s.b32 = ShieldedB32.wrap(sbytes32(bytes32(uint256(0xFF))));
        sm[0].u = ShieldedUint.wrap(suint256(42));
        sm[0].b = ShieldedBool.wrap(sbool(true));
        sm[0].a = ShieldedAddr.wrap(saddress(address(0xBEEF)));
        sm[0].b32 = ShieldedB32.wrap(sbytes32(bytes32(uint256(0xFF))));
        mBool[0] = ShieldedBool.wrap(sbool(true));
        mAddr[0] = ShieldedAddr.wrap(saddress(address(0xBEEF)));
        mB32[0] = ShieldedB32.wrap(sbytes32(bytes32(uint256(0xFF))));
        mInt[0] = ShieldedInt.wrap(sint256(-7));
    }

    // --- Plain: inline unwrap+cast ---
    function plainInline() public view returns (uint256) {
        return uint256(ShieldedUint.unwrap(plain));
    }
    function plainTwoStep() public view returns (uint256) {
        ShieldedUint v = plain;
        return uint256(ShieldedUint.unwrap(v));
    }

    // --- Mapping: inline unwrap+cast ---
    function mapInline() public view returns (uint256) {
        return uint256(ShieldedUint.unwrap(m[0]));
    }
    function mapInlineAssigned() public view returns (uint256) {
        uint256 v = uint256(ShieldedUint.unwrap(m[0]));
        return v;
    }
    function mapTwoStep() public view returns (uint256) {
        ShieldedUint v = m[0];
        return uint256(ShieldedUint.unwrap(v));
    }

    // --- Array: inline unwrap+cast ---
    function arrInline() public view returns (uint256) {
        return uint256(ShieldedUint.unwrap(arr[0]));
    }
    function arrTwoStep() public view returns (uint256) {
        ShieldedUint v = arr[0];
        return uint256(ShieldedUint.unwrap(v));
    }

    // --- Struct: inline unwrap+cast ---
    function structInline() public view returns (uint256) {
        return uint256(ShieldedUint.unwrap(s.u));
    }
    function structTwoStep() public view returns (uint256) {
        ShieldedUint v = s.u;
        return uint256(ShieldedUint.unwrap(v));
    }

    // --- Mapping-of-struct: inline unwrap+cast ---
    function mapStructInline() public view returns (uint256) {
        return uint256(ShieldedUint.unwrap(sm[0].u));
    }
    function mapStructTwoStep() public view returns (uint256) {
        ShieldedUint v = sm[0].u;
        return uint256(ShieldedUint.unwrap(v));
    }

    // --- Other UDVT types from mappings (inline) ---
    function mapBoolInline() public view returns (bool) {
        return bool(ShieldedBool.unwrap(mBool[0]));
    }
    function mapAddrInline() public view returns (address) {
        return address(ShieldedAddr.unwrap(mAddr[0]));
    }
    function mapB32Inline() public view returns (bytes32) {
        return bytes32(ShieldedB32.unwrap(mB32[0]));
    }
    function mapIntInline() public view returns (int256) {
        return int256(ShieldedInt.unwrap(mInt[0]));
    }

    // --- Struct fields: other UDVT types (inline) ---
    function structBoolInline() public view returns (bool) {
        return bool(ShieldedBool.unwrap(s.b));
    }
    function structAddrInline() public view returns (address) {
        return address(ShieldedAddr.unwrap(s.a));
    }
    function structB32Inline() public view returns (bytes32) {
        return bytes32(ShieldedB32.unwrap(s.b32));
    }

    // --- Mapping-of-struct fields: other UDVT types (inline) ---
    function mapStructBoolInline() public view returns (bool) {
        return bool(ShieldedBool.unwrap(sm[0].b));
    }
    function mapStructAddrInline() public view returns (address) {
        return address(ShieldedAddr.unwrap(sm[0].a));
    }
    function mapStructB32Inline() public view returns (bytes32) {
        return bytes32(ShieldedB32.unwrap(sm[0].b32));
    }
}
// ----
// store() ->
// plainTwoStep() -> 42
// plainInline() -> 42
// mapTwoStep() -> 42
// mapInline() -> 42
// mapInlineAssigned() -> 42
// arrTwoStep() -> 42
// arrInline() -> 42
// structTwoStep() -> 42
// structInline() -> 42
// mapStructTwoStep() -> 42
// mapStructInline() -> 42
// mapBoolInline() -> true
// mapAddrInline() -> 0xbeef
// mapB32Inline() -> 0xff
// mapIntInline() -> -7
// structBoolInline() -> true
// structAddrInline() -> 0xbeef
// structB32Inline() -> 0xff
// mapStructBoolInline() -> true
// mapStructAddrInline() -> 0xbeef
// mapStructB32Inline() -> 0xff
