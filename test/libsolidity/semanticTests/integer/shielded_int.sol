contract test {
    function intMinA() public pure returns (bool) {
        sint8 int8_min = type(sint8).min;
        require(int8_min == sint8(-2**7));

        sint16 int16_min = type(sint16).min;
        require(int16_min == sint16(-2**15));

        sint24 int24_min = type(sint24).min;
        require(int24_min == sint24(-2**23));

        sint32 int32_min = type(sint32).min;
        require(int32_min == sint32(-2**31));

        sint40 int40_min = type(sint40).min;
        require(int40_min == sint40(-2**39));

        sint48 int48_min = type(sint48).min;
        require(int48_min == sint48(-2**47));

        sint56 int56_min = type(sint56).min;
        require(int56_min == sint56(-2**55));

        sint64 int64_min = type(sint64).min;
        require(int64_min == sint64(-2**63));

        return true;
    }

    function intMinB() public pure returns (bool) {
        sint72 int72_min = type(sint72).min;
        require(int72_min == sint72(-2**71));

        sint80 int80_min = type(sint80).min;
        require(int80_min == sint80(-2**79));

        sint88 int88_min = type(sint88).min;
        require(int88_min == sint88(-2**87));

        sint96 int96_min = type(sint96).min;
        require(int96_min == sint96(-2**95));

        sint104 int104_min = type(sint104).min;
        require(int104_min == sint104(-2**103));

        sint112 int112_min = type(sint112).min;
        require(int112_min == sint112(-2**111));

        sint120 int120_min = type(sint120).min;
        require(int120_min == sint120(-2**119));

        sint128 int128_min = type(sint128).min;
        require(int128_min == sint128(-2**127));

        return true;
    }

    function intMinC() public pure returns (bool) {

        sint136 int136_min = type(sint136).min;
        require(int136_min == sint136(-2**135));

        sint144 int144_min = type(sint144).min;
        require(int144_min == sint144(-2**143));

        sint152 int152_min = type(sint152).min;
        require(int152_min == sint152(-2**151));

        sint160 int160_min = type(sint160).min;
        require(int160_min == sint160(-2**159));

        sint168 int168_min = type(sint168).min;
        require(int168_min == sint168(-2**167));

        sint176 int176_min = type(sint176).min;
        require(int176_min == sint176(-2**175));

        sint184 int184_min = type(sint184).min;
        require(int184_min == sint184(-2**183));

        sint192 int192_min = type(sint192).min;
        require(int192_min == sint192(-2**191));

        return true;
    }

    function intMinD() public pure returns (bool) {

        sint200 int200_min = type(sint200).min;
        require(int200_min == sint200(-2**199));

        sint208 int208_min = type(sint208).min;
        require(int208_min == sint208(-2**207));

        sint216 int216_min = type(sint216).min;
        require(int216_min == sint216(-2**215));

        sint224 int224_min = type(sint224).min;
        require(int224_min == sint224(-2**223));

        sint232 int232_min = type(sint232).min;
        require(int232_min == sint232(-2**231));

        sint240 int240_min = type(sint240).min;
        require(int240_min == sint240(-2**239));

        sint248 int248_min = type(sint248).min;
        require(int248_min == sint248(-2**247));

        sint256 int256_min = type(sint256).min;
        require(int256_min == sint256(-2**255));

        return true;
    }

    function intMaxA() public pure returns (bool) {

        sint8 int8_max = type(sint8).max;
        require(int8_max == sint8(2**7-1));

        sint16 int16_max = type(sint16).max;
        require(int16_max == sint16(2**15-1));

        sint24 int24_max = type(sint24).max;
        require(int24_max == sint24(2**23-1));

        sint32 int32_max = type(sint32).max;
        require(int32_max == sint32(2**31-1));

        sint40 int40_max = type(sint40).max;
        require(int40_max == sint40(2**39-1));

        sint48 int48_max = type(sint48).max;
        require(int48_max == sint48(2**47-1));

        sint56 int56_max = type(sint56).max;
        require(int56_max == sint56(2**55-1));

        sint64 int64_max = type(sint64).max;
        require(int64_max == sint64(2**63-1));

        return true;
    }

    function intMaxB() public pure returns (bool) {

        sint72 int72_max = type(sint72).max;
        require(int72_max == sint72(2**71-1));

        sint80 int80_max = type(sint80).max;
        require(int80_max == sint80(2**79-1));

        sint88 int88_max = type(sint88).max;
        require(int88_max == sint88(2**87-1));

        sint96 int96_max = type(sint96).max;
        require(int96_max == sint96(2**95-1));

        sint104 int104_max = type(sint104).max;
        require(int104_max == sint104(2**103-1));

        sint112 int112_max = type(sint112).max;
        require(int112_max == sint112(2**111-1));

        sint120 int120_max = type(sint120).max;
        require(int120_max == sint120(2**119-1));

        sint128 int128_max = type(sint128).max;
        require(int128_max == sint128(2**127-1));

        return true;
    }

    function intMaxC() public pure returns (bool) {

        sint136 int136_max = type(sint136).max;
        require(int136_max == sint136(2**135-1));

        sint144 int144_max = type(sint144).max;
        require(int144_max == sint144(2**143-1));

        sint152 int152_max = type(sint152).max;
        require(int152_max == sint152(2**151-1));

        sint160 int160_max = type(sint160).max;
        require(int160_max == sint160(2**159-1));

        sint168 int168_max = type(sint168).max;
        require(int168_max == sint168(2**167-1));

        sint176 int176_max = type(sint176).max;
        require(int176_max == sint176(2**175-1));

        sint184 int184_max = type(sint184).max;
        require(int184_max == sint184(2**183-1));

        sint192 int192_max = type(sint192).max;
        require(int192_max == sint192(2**191-1));

        return true;
    }

    function intMaxD() public pure returns (bool) {

        sint200 int200_max = type(sint200).max;
        require(int200_max == sint200(2**199-1));

        sint208 int208_max = type(sint208).max;
        require(int208_max == sint208(2**207-1));

        sint216 int216_max = type(sint216).max;
        require(int216_max == sint216(2**215-1));

        sint224 int224_max = type(sint224).max;
        require(int224_max == sint224(2**223-1));

        sint232 int232_max = type(sint232).max;
        require(int232_max == sint232(2**231-1));

        sint240 int240_max = type(sint240).max;
        require(int240_max == sint240(2**239-1));

        sint248 int248_max = type(sint248).max;
        require(int248_max == sint248(2**247-1));

        sint256 int256_max = type(sint256).max;
        require(int256_max == sint256(2**255-1));

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
