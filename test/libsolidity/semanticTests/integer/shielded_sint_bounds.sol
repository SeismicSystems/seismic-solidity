// Adapted from: https://github.com/argotorg/solidity/blob/develop/test/libsolidity/semanticTests/integer/int.sol
contract test {

    function intMinA() public pure returns (bool) {

        sint8 sint8_min = type(sint8).min;
        require(int8(sint8_min) == -2**7);

        sint16 sint16_min = type(sint16).min;
        require(int16(sint16_min) == -2**15);

        sint24 sint24_min = type(sint24).min;
        require(int24(sint24_min) == -2**23);

        sint32 sint32_min = type(sint32).min;
        require(int32(sint32_min) == -2**31);

        sint40 sint40_min = type(sint40).min;
        require(int40(sint40_min) == -2**39);

        sint48 sint48_min = type(sint48).min;
        require(int48(sint48_min) == -2**47);

        sint56 sint56_min = type(sint56).min;
        require(int56(sint56_min) == -2**55);

        sint64 sint64_min = type(sint64).min;
        require(int64(sint64_min) == -2**63);

        return true;
    }

    function intMinB() public pure returns(bool) {

        sint72 sint72_min = type(sint72).min;
        require(int72(sint72_min) == -2**71);

        sint80 sint80_min = type(sint80).min;
        require(int80(sint80_min) == -2**79);

        sint88 sint88_min = type(sint88).min;
        require(int88(sint88_min) == -2**87);

        sint96 sint96_min = type(sint96).min;
        require(int96(sint96_min) == -2**95);

        sint104 sint104_min = type(sint104).min;
        require(int104(sint104_min) == -2**103);

        sint112 sint112_min = type(sint112).min;
        require(int112(sint112_min) == -2**111);

        sint120 sint120_min = type(sint120).min;
        require(int120(sint120_min) == -2**119);

        sint128 sint128_min = type(sint128).min;
        require(int128(sint128_min) == -2**127);

        return true;
    }

    function intMinC() public pure returns (bool) {

        sint136 sint136_min = type(sint136).min;
        require(int136(sint136_min) == -2**135);

        sint144 sint144_min = type(sint144).min;
        require(int144(sint144_min) == -2**143);

        sint152 sint152_min = type(sint152).min;
        require(int152(sint152_min) == -2**151);

        sint160 sint160_min = type(sint160).min;
        require(int160(sint160_min) == -2**159);

        sint168 sint168_min = type(sint168).min;
        require(int168(sint168_min) == -2**167);

        sint176 sint176_min = type(sint176).min;
        require(int176(sint176_min) == -2**175);

        sint184 sint184_min = type(sint184).min;
        require(int184(sint184_min) == -2**183);

        sint192 sint192_min = type(sint192).min;
        require(int192(sint192_min) == -2**191);

        return true;
    }

    function intMinD() public pure returns(bool) {

        sint200 sint200_min = type(sint200).min;
        require(int200(sint200_min) == -2**199);

        sint208 sint208_min = type(sint208).min;
        require(int208(sint208_min) == -2**207);

        sint216 sint216_min = type(sint216).min;
        require(int216(sint216_min) == -2**215);

        sint224 sint224_min = type(sint224).min;
        require(int224(sint224_min) == -2**223);

        sint232 sint232_min = type(sint232).min;
        require(int232(sint232_min) == -2**231);

        sint240 sint240_min = type(sint240).min;
        require(int240(sint240_min) == -2**239);

        sint248 sint248_min = type(sint248).min;
        require(int248(sint248_min) == -2**247);

        sint256 sint256_min = type(sint256).min;
        require(int256(sint256_min) == -2**255);

        return true;
    }

    function intMaxA() public pure returns (bool) {

        sint8 sint8_max = type(sint8).max;
        require(int8(sint8_max) == 2**7-1);

        sint16 sint16_max = type(sint16).max;
        require(int16(sint16_max) == 2**15-1);

        sint24 sint24_max = type(sint24).max;
        require(int24(sint24_max) == 2**23-1);

        sint32 sint32_max = type(sint32).max;
        require(int32(sint32_max) == 2**31-1);

        sint40 sint40_max = type(sint40).max;
        require(int40(sint40_max) == 2**39-1);

        sint48 sint48_max = type(sint48).max;
        require(int48(sint48_max) == 2**47-1);

        sint56 sint56_max = type(sint56).max;
        require(int56(sint56_max) == 2**55-1);

        sint64 sint64_max = type(sint64).max;
        require(int64(sint64_max) == 2**63-1);

        return true;
    }

    function intMaxB() public pure returns(bool) {

        sint72 sint72_max = type(sint72).max;
        require(int72(sint72_max) == 2**71-1);

        sint80 sint80_max = type(sint80).max;
        require(int80(sint80_max) == 2**79-1);

        sint88 sint88_max = type(sint88).max;
        require(int88(sint88_max) == 2**87-1);

        sint96 sint96_max = type(sint96).max;
        require(int96(sint96_max) == 2**95-1);

        sint104 sint104_max = type(sint104).max;
        require(int104(sint104_max) == 2**103-1);

        sint112 sint112_max = type(sint112).max;
        require(int112(sint112_max) == 2**111-1);

        sint120 sint120_max = type(sint120).max;
        require(int120(sint120_max) == 2**119-1);

        sint128 sint128_max = type(sint128).max;
        require(int128(sint128_max) == 2**127-1);

        return true;
    }

    function intMaxC() public pure returns (bool) {

        sint136 sint136_max = type(sint136).max;
        require(int136(sint136_max) == 2**135-1);

        sint144 sint144_max = type(sint144).max;
        require(int144(sint144_max) == 2**143-1);

        sint152 sint152_max = type(sint152).max;
        require(int152(sint152_max) == 2**151-1);

        sint160 sint160_max = type(sint160).max;
        require(int160(sint160_max) == 2**159-1);

        sint168 sint168_max = type(sint168).max;
        require(int168(sint168_max) == 2**167-1);

        sint176 sint176_max = type(sint176).max;
        require(int176(sint176_max) == 2**175-1);

        sint184 sint184_max = type(sint184).max;
        require(int184(sint184_max) == 2**183-1);

        sint192 sint192_max = type(sint192).max;
        require(int192(sint192_max) == 2**191-1);

        return true;
    }

    function intMaxD() public pure returns(bool) {

        sint200 sint200_max = type(sint200).max;
        require(int200(sint200_max) == 2**199-1);

        sint208 sint208_max = type(sint208).max;
        require(int208(sint208_max) == 2**207-1);

        sint216 sint216_max = type(sint216).max;
        require(int216(sint216_max) == 2**215-1);

        sint224 sint224_max = type(sint224).max;
        require(int224(sint224_max) == 2**223-1);

        sint232 sint232_max = type(sint232).max;
        require(int232(sint232_max) == 2**231-1);

        sint240 sint240_max = type(sint240).max;
        require(int240(sint240_max) == 2**239-1);

        sint248 sint248_max = type(sint248).max;
        require(int248(sint248_max) == 2**247-1);

        sint256 sint256_max = type(sint256).max;
        require(int256(sint256_max) == 2**255-1);

        return true;
    }
}
// ----
// intMinA() -> true
// intMinB() -> true
// intMinC() -> true
// intMinD() -> true
// intMaxA() -> true
// intMaxB() -> true
// intMaxC() -> true
// intMaxD() -> true
