contract test {
    function suintMinA() public pure returns(bool) {
        suint8 suint8_min = type(suint8).min;
        require(suint8_min == suint8(0));

        suint16 suint16_min = type(suint16).min;
        require(suint16_min == suint16(0));

        suint24 suint24_min = type(suint24).min;
        require(suint24_min == suint24(0));

        suint32 suint32_min = type(suint32).min;
        require(suint32_min == suint32(0));

        suint40 suint40_min = type(suint40).min;
        require(suint40_min == suint40(0));

        suint48 suint48_min = type(suint48).min;
        require(suint48_min == suint48(0));

        suint56 suint56_min = type(suint56).min;
        require(suint56_min == suint56(0));

        suint64 suint64_min = type(suint64).min;
        require(suint64_min == suint64(0));

        return true;
    }

    function suintMinB() public pure returns(bool) {
        suint72 suint72_min = type(suint72).min;
        require(suint72_min == suint72(0));

        suint80 suint80_min = type(suint80).min;
        require(suint80_min == suint80(0));

        suint88 suint88_min = type(suint88).min;
        require(suint88_min == suint88(0));

        suint96 suint96_min = type(suint96).min;
        require(suint96_min == suint96(0));

        suint104 suint104_min = type(suint104).min;
        require(suint104_min == suint104(0));

        suint112 suint112_min = type(suint112).min;
        require(suint112_min == suint112(0));

        suint120 suint120_min = type(suint120).min;
        require(suint120_min == suint120(0));

        suint128 suint128_min = type(suint128).min;
        require(suint128_min == suint128(0));

        return true;
    }

    function suintMinC() public pure returns(bool) {
        suint136 suint136_min = type(suint136).min;
        require(suint136_min == suint136(0));

        suint144 suint144_min = type(suint144).min;
        require(suint144_min == suint144(0));

        suint152 suint152_min = type(suint152).min;
        require(suint152_min == suint152(0));

        suint160 suint160_min = type(suint160).min;
        require(suint160_min == suint160(0));

        suint168 suint168_min = type(suint168).min;
        require(suint168_min == suint168(0));

        suint176 suint176_min = type(suint176).min;
        require(suint176_min == suint176(0));

        suint184 suint184_min = type(suint184).min;
        require(suint184_min == suint184(0));

        suint192 suint192_min = type(suint192).min;
        require(suint192_min == suint192(0));

        return true;
    }

    function suintMinD() public pure returns(bool) {
        suint200 suint200_min = type(suint200).min;
        require(suint200_min == suint200(0));

        suint208 suint208_min = type(suint208).min;
        require(suint208_min == suint208(0));

        suint216 suint216_min = type(suint216).min;
        require(suint216_min == suint216(0));

        suint224 suint224_min = type(suint224).min;
        require(suint224_min == suint224(0));

        suint232 suint232_min = type(suint232).min;
        require(suint232_min == suint232(0));

        suint240 suint240_min = type(suint240).min;
        require(suint240_min == suint240(0));

        suint248 suint248_min = type(suint248).min;
        require(suint248_min == suint248(0));

        suint256 suint256_min = type(suint256).min;
        require(suint256_min == suint256(0));

        return true;
    }

    function suintMaxA() public pure returns (bool) {
        suint8 suint8_max = type(suint8).max;
        require(suint8_max == suint8(2**8-1));

        suint16 suint16_max = type(suint16).max;
        require(suint16_max == suint16(2**16-1));

        suint24 suint24_max = type(suint24).max;
        require(suint24_max == suint24(2**24-1));

        suint32 suint32_max = type(suint32).max;
        require(suint32_max == suint32(2**32-1));

        suint40 suint40_max = type(suint40).max;
        require(suint40_max == suint40(2**40-1));

        suint48 suint48_max = type(suint48).max;
        require(suint48_max == suint48(2**48-1));

        suint56 suint56_max = type(suint56).max;
        require(suint56_max == suint56(2**56-1));

        suint64 suint64_max = type(suint64).max;
        require(suint64_max == suint64(2**64-1));

        return true;
    }

    function suintMaxB() public pure returns (bool) {
        suint72 suint72_max = type(suint72).max;
        require(suint72_max == suint72(2**72-1));

        suint80 suint80_max = type(suint80).max;
        require(suint80_max == suint80(2**80-1));

        suint88 suint88_max = type(suint88).max;
        require(suint88_max == suint88(2**88-1));

        suint96 suint96_max = type(suint96).max;
        require(suint96_max == suint96(2**96-1));

        suint104 suint104_max = type(suint104).max;
        require(suint104_max == suint104(2**104-1));

        suint112 suint112_max = type(suint112).max;
        require(suint112_max == suint112(2**112-1));

        suint120 suint120_max = type(suint120).max;
        require(suint120_max == suint120(2**120-1));

        suint128 suint128_max = type(suint128).max;
        require(suint128_max == suint128(2**128-1));

        return true;
    }

    function suintMaxC() public pure returns (bool) {
        suint136 suint136_max = type(suint136).max;
        require(suint136_max == suint136(2**136-1));

        suint144 suint144_max = type(suint144).max;
        require(suint144_max == suint144(2**144-1));

        suint152 suint152_max = type(suint152).max;
        require(suint152_max == suint152(2**152-1));

        suint160 suint160_max = type(suint160).max;
        require(suint160_max == suint160(2**160-1));

        suint168 suint168_max = type(suint168).max;
        require(suint168_max == suint168(2**168-1));

        suint176 suint176_max = type(suint176).max;
        require(suint176_max == suint176(2**176-1));

        suint184 suint184_max = type(suint184).max;
        require(suint184_max == suint184(2**184-1));

        suint192 suint192_max = type(suint192).max;
        require(suint192_max == suint192(2**192-1));

        return true;
    }

    function suintMaxD() public pure returns(bool) {
        suint200 suint200_max = type(suint200).max;
        require(suint200_max == suint200(2**200-1));

        suint208 suint208_max = type(suint208).max;
        require(suint208_max == suint208(2**208-1));

        suint216 suint216_max = type(suint216).max;
        require(suint216_max == suint216(2**216-1));

        suint224 suint224_max = type(suint224).max;
        require(suint224_max == suint224(2**224-1));

        suint232 suint232_max = type(suint232).max;
        require(suint232_max == suint232(2**232-1));

        suint240 suint240_max = type(suint240).max;
        require(suint240_max == suint240(2**240-1));

        suint248 suint248_max = type(suint248).max;
        require(suint248_max == suint248(2**248-1));

        suint256 suint256_max = type(suint256).max;
        require(suint256_max == suint256(2**256-1));

        return true;
    }
}
// ----
// suintMinA() -> true
// suintMinB() -> true
// suintMinC() -> true
// suintMinD() -> true
// suintMaxA() -> true
// suintMaxB() -> true
// suintMaxC() -> true
// suintMaxD() -> true
