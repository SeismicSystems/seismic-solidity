// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBytesBuiltins {
    // Each test casts sync_rng_bN() → bytesN → uintN*8, then checks randomness.
    // For N*8 >= 30 bits: check val in [2^(N*8-30), max - 2^(N*8-30)].
    // P(false positive) ≈ 2 * 2^(-30) ≈ 2e-9 per test.
    // For smaller types: combine multiple samples.

    function testRngB1() public view returns (bool) {
        // 8 bits: four samples, check not all-zero and not all-ones.
        uint8 a = uint8(bytes1(sync_rng_b1()));
        uint8 b = uint8(bytes1(sync_rng_b1()));
        uint8 c = uint8(bytes1(sync_rng_b1()));
        uint8 d = uint8(bytes1(sync_rng_b1()));
        return (a | b | c | d) > 0 && (a & b & c & d) < type(uint8).max;
    }

    function testRngB2() public view returns (bool) {
        // 16 bits: two samples, check not all-zero and not all-ones.
        uint16 a = uint16(bytes2(sync_rng_b2()));
        uint16 b = uint16(bytes2(sync_rng_b2()));
        return (a | b) > 0 && (a & b) < type(uint16).max;
    }

    function testRngB3() public view returns (bool) {
        // 24 bits: two samples, check not all-zero and not all-ones.
        uint24 a = uint24(bytes3(sync_rng_b3()));
        uint24 b = uint24(bytes3(sync_rng_b3()));
        return (a | b) > 0 && (a & b) < type(uint24).max;
    }

    function testRngB4() public view returns (bool) {
        uint32 val = uint32(bytes4(sync_rng_b4()));
        return val >= 4 && val <= type(uint32).max - 4;
    }

    function testRngB5() public view returns (bool) {
        uint40 val = uint40(bytes5(sync_rng_b5()));
        return val >= 2**10 && val <= type(uint40).max - 2**10;
    }

    function testRngB6() public view returns (bool) {
        uint48 val = uint48(bytes6(sync_rng_b6()));
        return val >= 2**18 && val <= type(uint48).max - 2**18;
    }

    function testRngB7() public view returns (bool) {
        uint56 val = uint56(bytes7(sync_rng_b7()));
        return val >= 2**26 && val <= type(uint56).max - 2**26;
    }

    function testRngB8() public view returns (bool) {
        uint64 val = uint64(bytes8(sync_rng_b8()));
        return val >= 2**34 && val <= type(uint64).max - 2**34;
    }

    function testRngB9() public view returns (bool) {
        uint72 val = uint72(bytes9(sync_rng_b9()));
        return val >= 2**42 && val <= type(uint72).max - 2**42;
    }

    function testRngB10() public view returns (bool) {
        uint80 val = uint80(bytes10(sync_rng_b10()));
        return val >= 2**50 && val <= type(uint80).max - 2**50;
    }

    function testRngB11() public view returns (bool) {
        uint88 val = uint88(bytes11(sync_rng_b11()));
        return val >= 2**58 && val <= type(uint88).max - 2**58;
    }

    function testRngB12() public view returns (bool) {
        uint96 val = uint96(bytes12(sync_rng_b12()));
        return val >= 2**66 && val <= type(uint96).max - 2**66;
    }

    function testRngB13() public view returns (bool) {
        uint104 val = uint104(bytes13(sync_rng_b13()));
        return val >= 2**74 && val <= type(uint104).max - 2**74;
    }

    function testRngB14() public view returns (bool) {
        uint112 val = uint112(bytes14(sync_rng_b14()));
        return val >= 2**82 && val <= type(uint112).max - 2**82;
    }

    function testRngB15() public view returns (bool) {
        uint120 val = uint120(bytes15(sync_rng_b15()));
        return val >= 2**90 && val <= type(uint120).max - 2**90;
    }

    function testRngB16() public view returns (bool) {
        uint128 val = uint128(bytes16(sync_rng_b16()));
        return val >= 2**98 && val <= type(uint128).max - 2**98;
    }

    function testRngB17() public view returns (bool) {
        uint136 val = uint136(bytes17(sync_rng_b17()));
        return val >= 2**106 && val <= type(uint136).max - 2**106;
    }

    function testRngB18() public view returns (bool) {
        uint144 val = uint144(bytes18(sync_rng_b18()));
        return val >= 2**114 && val <= type(uint144).max - 2**114;
    }

    function testRngB19() public view returns (bool) {
        uint152 val = uint152(bytes19(sync_rng_b19()));
        return val >= 2**122 && val <= type(uint152).max - 2**122;
    }

    function testRngB20() public view returns (bool) {
        uint160 val = uint160(bytes20(sync_rng_b20()));
        return val >= 2**130 && val <= type(uint160).max - 2**130;
    }

    function testRngB21() public view returns (bool) {
        uint168 val = uint168(bytes21(sync_rng_b21()));
        return val >= 2**138 && val <= type(uint168).max - 2**138;
    }

    function testRngB22() public view returns (bool) {
        uint176 val = uint176(bytes22(sync_rng_b22()));
        return val >= 2**146 && val <= type(uint176).max - 2**146;
    }

    function testRngB23() public view returns (bool) {
        uint184 val = uint184(bytes23(sync_rng_b23()));
        return val >= 2**154 && val <= type(uint184).max - 2**154;
    }

    function testRngB24() public view returns (bool) {
        uint192 val = uint192(bytes24(sync_rng_b24()));
        return val >= 2**162 && val <= type(uint192).max - 2**162;
    }

    function testRngB25() public view returns (bool) {
        uint200 val = uint200(bytes25(sync_rng_b25()));
        return val >= 2**170 && val <= type(uint200).max - 2**170;
    }

    function testRngB26() public view returns (bool) {
        uint208 val = uint208(bytes26(sync_rng_b26()));
        return val >= 2**178 && val <= type(uint208).max - 2**178;
    }

    function testRngB27() public view returns (bool) {
        uint216 val = uint216(bytes27(sync_rng_b27()));
        return val >= 2**186 && val <= type(uint216).max - 2**186;
    }

    function testRngB28() public view returns (bool) {
        uint224 val = uint224(bytes28(sync_rng_b28()));
        return val >= 2**194 && val <= type(uint224).max - 2**194;
    }

    function testRngB29() public view returns (bool) {
        uint232 val = uint232(bytes29(sync_rng_b29()));
        return val >= 2**202 && val <= type(uint232).max - 2**202;
    }

    function testRngB30() public view returns (bool) {
        uint240 val = uint240(bytes30(sync_rng_b30()));
        return val >= 2**210 && val <= type(uint240).max - 2**210;
    }

    function testRngB31() public view returns (bool) {
        uint248 val = uint248(bytes31(sync_rng_b31()));
        return val >= 2**218 && val <= type(uint248).max - 2**218;
    }

    function testRngB32() public view returns (bool) {
        uint256 val = uint256(bytes32(sync_rng_b32()));
        return val >= 2**226 && val <= type(uint256).max - 2**226;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRngB1() -> true
// testRngB2() -> true
// testRngB3() -> true
// testRngB4() -> true
// testRngB5() -> true
// testRngB6() -> true
// testRngB7() -> true
// testRngB8() -> true
// testRngB9() -> true
// testRngB10() -> true
// testRngB11() -> true
// testRngB12() -> true
// testRngB13() -> true
// testRngB14() -> true
// testRngB15() -> true
// testRngB16() -> true
// testRngB17() -> true
// testRngB18() -> true
// testRngB19() -> true
// testRngB20() -> true
// testRngB21() -> true
// testRngB22() -> true
// testRngB23() -> true
// testRngB24() -> true
// testRngB25() -> true
// testRngB26() -> true
// testRngB27() -> true
// testRngB28() -> true
// testRngB29() -> true
// testRngB30() -> true
// testRngB31() -> true
// testRngB32() -> true
