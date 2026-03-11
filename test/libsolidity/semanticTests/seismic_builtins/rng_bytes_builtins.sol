// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RngBytesBuiltins {
    // Each test verifies the sync_rng_bN call succeeds and the result looks random.
    // For N-byte types (N >= 4): check that the value is neither all-zero nor all-ones.
    // P(false positive) ≈ 2 * 2^(-N*8) which is negligible for N >= 4.
    // For smaller types: combine multiple samples.

    function testRngB32() public view returns (bool) {
        bytes32 val = bytes32(sync_rng_b32());
        return val != bytes32(0) && val != bytes32(type(uint256).max);
    }

    function testRngB16() public view returns (bool) {
        bytes16 val = bytes16(sync_rng_b16());
        return val != bytes16(0) && val != bytes16(type(uint128).max);
    }

    function testRngB8() public view returns (bool) {
        bytes8 val = bytes8(sync_rng_b8());
        return val != bytes8(0) && val != bytes8(type(uint64).max);
    }

    function testRngB4() public view returns (bool) {
        bytes4 val = bytes4(sync_rng_b4());
        return val != bytes4(0) && val != bytes4(type(uint32).max);
    }

    function testRngB2() public view returns (bool) {
        // 2 bytes: two samples, check not all-zero and not all-ones.
        bytes2 a = bytes2(sync_rng_b2());
        bytes2 b = bytes2(sync_rng_b2());
        return (a | b) > bytes2(0) && (a & b) < bytes2(type(uint16).max);
    }

    function testRngB1() public view returns (bool) {
        // 1 byte: four samples, check not all-zero and not all-ones.
        bytes1 a = bytes1(sync_rng_b1());
        bytes1 b = bytes1(sync_rng_b1());
        bytes1 c = bytes1(sync_rng_b1());
        bytes1 d = bytes1(sync_rng_b1());
        return (a | b | c | d) > bytes1(0) && (a & b & c & d) < bytes1(type(uint8).max);
    }

    function testRngB3() public view returns (bool) {
        bytes3 val = bytes3(sync_rng_b3());
        return val != bytes3(0) && val != bytes3(type(uint24).max);
    }

    function testRngB5() public view returns (bool) {
        bytes5 val = bytes5(sync_rng_b5());
        return val != bytes5(0) && val != bytes5(type(uint40).max);
    }

    function testRngB6() public view returns (bool) {
        bytes6 val = bytes6(sync_rng_b6());
        return val != bytes6(0) && val != bytes6(type(uint48).max);
    }

    function testRngB7() public view returns (bool) {
        bytes7 val = bytes7(sync_rng_b7());
        return val != bytes7(0) && val != bytes7(type(uint56).max);
    }

    function testRngB9() public view returns (bool) {
        bytes9 val = bytes9(sync_rng_b9());
        return val != bytes9(0) && val != bytes9(type(uint72).max);
    }

    function testRngB10() public view returns (bool) {
        bytes10 val = bytes10(sync_rng_b10());
        return val != bytes10(0) && val != bytes10(type(uint80).max);
    }

    function testRngB11() public view returns (bool) {
        bytes11 val = bytes11(sync_rng_b11());
        return val != bytes11(0) && val != bytes11(type(uint88).max);
    }

    function testRngB12() public view returns (bool) {
        bytes12 val = bytes12(sync_rng_b12());
        return val != bytes12(0) && val != bytes12(type(uint96).max);
    }

    function testRngB13() public view returns (bool) {
        bytes13 val = bytes13(sync_rng_b13());
        return val != bytes13(0) && val != bytes13(type(uint104).max);
    }

    function testRngB14() public view returns (bool) {
        bytes14 val = bytes14(sync_rng_b14());
        return val != bytes14(0) && val != bytes14(type(uint112).max);
    }

    function testRngB15() public view returns (bool) {
        bytes15 val = bytes15(sync_rng_b15());
        return val != bytes15(0) && val != bytes15(type(uint120).max);
    }

    function testRngB17() public view returns (bool) {
        bytes17 val = bytes17(sync_rng_b17());
        return val != bytes17(0) && val != bytes17(type(uint136).max);
    }

    function testRngB18() public view returns (bool) {
        bytes18 val = bytes18(sync_rng_b18());
        return val != bytes18(0) && val != bytes18(type(uint144).max);
    }

    function testRngB19() public view returns (bool) {
        bytes19 val = bytes19(sync_rng_b19());
        return val != bytes19(0) && val != bytes19(type(uint152).max);
    }

    function testRngB20() public view returns (bool) {
        bytes20 val = bytes20(sync_rng_b20());
        return val != bytes20(0) && val != bytes20(type(uint160).max);
    }

    function testRngB21() public view returns (bool) {
        bytes21 val = bytes21(sync_rng_b21());
        return val != bytes21(0) && val != bytes21(type(uint168).max);
    }

    function testRngB22() public view returns (bool) {
        bytes22 val = bytes22(sync_rng_b22());
        return val != bytes22(0) && val != bytes22(type(uint176).max);
    }

    function testRngB23() public view returns (bool) {
        bytes23 val = bytes23(sync_rng_b23());
        return val != bytes23(0) && val != bytes23(type(uint184).max);
    }

    function testRngB24() public view returns (bool) {
        bytes24 val = bytes24(sync_rng_b24());
        return val != bytes24(0) && val != bytes24(type(uint192).max);
    }

    function testRngB25() public view returns (bool) {
        bytes25 val = bytes25(sync_rng_b25());
        return val != bytes25(0) && val != bytes25(type(uint200).max);
    }

    function testRngB26() public view returns (bool) {
        bytes26 val = bytes26(sync_rng_b26());
        return val != bytes26(0) && val != bytes26(type(uint208).max);
    }

    function testRngB27() public view returns (bool) {
        bytes27 val = bytes27(sync_rng_b27());
        return val != bytes27(0) && val != bytes27(type(uint216).max);
    }

    function testRngB28() public view returns (bool) {
        bytes28 val = bytes28(sync_rng_b28());
        return val != bytes28(0) && val != bytes28(type(uint224).max);
    }

    function testRngB29() public view returns (bool) {
        bytes29 val = bytes29(sync_rng_b29());
        return val != bytes29(0) && val != bytes29(type(uint232).max);
    }

    function testRngB30() public view returns (bool) {
        bytes30 val = bytes30(sync_rng_b30());
        return val != bytes30(0) && val != bytes30(type(uint240).max);
    }

    function testRngB31() public view returns (bool) {
        bytes31 val = bytes31(sync_rng_b31());
        return val != bytes31(0) && val != bytes31(type(uint248).max);
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testRngB32() -> true
// testRngB16() -> true
// testRngB8() -> true
// testRngB4() -> true
// testRngB2() -> true
// testRngB1() -> true
// testRngB3() -> true
// testRngB5() -> true
// testRngB6() -> true
// testRngB7() -> true
// testRngB9() -> true
// testRngB10() -> true
// testRngB11() -> true
// testRngB12() -> true
// testRngB13() -> true
// testRngB14() -> true
// testRngB15() -> true
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
