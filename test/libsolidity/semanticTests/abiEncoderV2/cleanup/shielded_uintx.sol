pragma abicoder               v2;

contract C {
    suint8 tmp8;
    suint16 tmp16;
    suint32 tmp32;
    suint64 tmp64;
    suint128 tmp128;

    function ggg8(suint8 x) external pure returns (uint256) {
        return uint8(x);
    }
    function gg16(suint16 x) external pure returns (uint256) {
        return uint16(x);
    }
    function gg32(suint32 x) external pure returns (uint256) {
        return uint32(x);
    }
    function gg64(suint64 x) external pure returns (uint256) {
        return uint64(x);
    }
    function g128(suint128 x) external pure returns (uint256) {
        return uint128(x);
    }
    function f8(uint256 a) external returns (uint256) {
        assembly { cstore(tmp8.slot, a) }
        return this.ggg8(tmp8);
    }
    function f16(uint256 a) external returns (uint256) {
        assembly { cstore(tmp16.slot, a) }
        return this.gg16(tmp16);
    }
    function f32(uint256 a) external returns (uint256) {
        assembly { cstore(tmp32.slot, a) }
        return this.gg32(tmp32);
    }
    function f64(uint256 a) external returns (uint256) {
        assembly { cstore(tmp64.slot, a) }
        return this.gg64(tmp64);
    }
    function f128(uint256 a) external returns (uint256) {
        assembly { cstore(tmp128.slot, a) }
        return this.g128(tmp128);
    }
}
// ----
// f8(uint256): 0 -> 0
// ggg8(suint8): 0 -> 0
// f8(uint256): 1 -> 1
// ggg8(suint8): 1 -> 1
// f8(uint256): 0xFE -> 0xFE
// ggg8(suint8): 0xFE -> 0xFE
// f8(uint256): 0xFF -> 0xFF
// ggg8(suint8): 0xFF -> 0xFF
// f8(uint256): 0x0100 -> 0x00
// ggg8(suint8): 0x0100 -> FAILURE
// f8(uint256): 0x0101 -> 0x01
// ggg8(suint8): 0x0101 -> FAILURE
// f8(uint256): -1 -> 0xFF
// ggg8(suint8): -1 -> FAILURE
// f16(uint256): 0 -> 0
// gg16(suint16): 0 -> 0
// f16(uint256): 1 -> 1
// gg16(suint16): 1 -> 1
// f16(uint256): 0xFFFE -> 0xFFFE
// gg16(suint16): 0xFFFE -> 0xFFFE
// f16(uint256): 0xFFFF -> 0xFFFF
// gg16(suint16): 0xFFFF -> 0xFFFF
// f16(uint256): 0x010000 -> 0x0000
// gg16(suint16): 0x010000 -> FAILURE
// f16(uint256): 0x010001 -> 0x0001
// gg16(suint16): 0x010001 -> FAILURE
// f16(uint256): -1 -> 0xFFFF
// gg16(suint16): -1 -> FAILURE
// f32(uint256): 0 -> 0
// gg32(suint32): 0 -> 0
// f32(uint256): 1 -> 1
// gg32(suint32): 1 -> 1
// f32(uint256): 0xFFFFFFFE -> 0xFFFFFFFE
// gg32(suint32): 0xFFFFFFFE -> 0xFFFFFFFE
// f32(uint256): 0xFFFFFFFF -> 0xFFFFFFFF
// gg32(suint32): 0xFFFFFFFF -> 0xFFFFFFFF
// f32(uint256): 0x0100000000 -> 0x00000000
// gg32(suint32): 0x0100000000 -> FAILURE
// f32(uint256): 0x0100000001 -> 0x00000001
// gg32(suint32): 0x0100000001 -> FAILURE
// f32(uint256): -1 -> 0xFFFFFFFF
// gg32(suint32): -1 -> FAILURE
// f64(uint256): 0 -> 0
// gg64(suint64): 0 -> 0
// f64(uint256): 1 -> 1
// gg64(suint64): 1 -> 1
// f64(uint256): 0xFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFE
// gg64(suint64): 0xFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFE
// f64(uint256): 0xFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFF
// gg64(suint64): 0xFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFF
// f64(uint256): 0x010000000000000000 -> 0x0000000000000000
// gg64(suint64): 0x010000000000000000 -> FAILURE
// f64(uint256): 0x010000000000000001 -> 0x0000000000000001
// gg64(suint64): 0x010000000000000001 -> FAILURE
// f64(uint256): -1 -> 0xFFFFFFFFFFFFFFFF
// gg64(suint64): -1 -> FAILURE
// f128(uint256): 0 -> 0
// g128(suint128): 0 -> 0
// f128(uint256): 1 -> 1
// g128(suint128): 1 -> 1
// f128(uint256): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// g128(suint128): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
// f128(uint256): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// g128(suint128): 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// f128(uint256): 0x0100000000000000000000000000000000 -> 0x00000000000000000000000000000000
// g128(suint128): 0x0100000000000000000000000000000000 -> FAILURE
// f128(uint256): 0x0100000000000000000000000000000001 -> 0x00000000000000000000000000000001
// g128(suint128): 0x0100000000000000000000000000000001 -> FAILURE
// f128(uint256): -1 -> 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
// g128(suint128): -1 -> FAILURE
