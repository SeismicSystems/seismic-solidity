contract C {
    uint[2] array1;

    suint[2] array2;
    sint[2] array3;

    suint8[2] array4;
    sint8[2] array5;

    suint16[2] array6;
    sint16[2] array7;

    function test_uint_length_type() public returns (uint)
    {
        array1[0] = 10;
        array1[1] = 20;
        return array1.length;
    }

    function test_suint_length_type() public returns (uint)
    {
        array2[0] = suint(10);
        array2[1] = suint(20);
        return array2.length;
    }

    function test_sint_length_type() public returns (uint)
    {
        array3[0] = sint(10);
        array3[1] = sint(20);
        return array3.length;
    }

    function test_suint8_length_type() public returns (uint)
    {
        array4[0] = suint8(10);
        array4[1] = suint8(20);
        return array4.length;
    }

    function test_sint8_length_type() public returns (uint)
    {
        array5[0] = sint8(10);
        array5[1] = sint8(20);
        return array5.length;
    }

    function test_suint16_length_type() public returns (uint)
    {
        array6[0] = suint16(10);
        array6[1] = suint16(20);
        return array6.length;
    }

    function test_sint16_length_type() public returns (uint)
    {
        array7[0] = sint16(10);
        array7[1] = sint16(20);
        return array7.length;
    }
}
// ----
// test_uint_length_type(): -> 2
// test_suint_length_type(): -> 2
// test_sint_length_type(): -> 2
// test_suint8_length_type(): -> 2
// test_sint8_length_type(): -> 2
// test_suint16_length_type(): -> 2
// test_sint16_length_type(): -> 2


