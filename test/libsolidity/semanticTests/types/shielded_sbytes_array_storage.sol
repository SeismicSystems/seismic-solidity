// Verify arrays of fixed sbytes in storage
contract C {
    sbytes4[3] private fixedArr;
    sbytes4[] private dynArr;

    function testFixedArray() public returns (bool) {
        fixedArr[0] = sbytes4(bytes4(0xAAAAAAAA));
        fixedArr[1] = sbytes4(bytes4(0xBBBBBBBB));
        fixedArr[2] = sbytes4(bytes4(0xCCCCCCCC));

        require(bytes4(fixedArr[0]) == bytes4(0xAAAAAAAA));
        require(bytes4(fixedArr[1]) == bytes4(0xBBBBBBBB));
        require(bytes4(fixedArr[2]) == bytes4(0xCCCCCCCC));

        return true;
    }

    function testDynamicArray() public returns (bool) {
        dynArr.push(sbytes4(bytes4(0x11111111)));
        dynArr.push(sbytes4(bytes4(0x22222222)));
        dynArr.push(sbytes4(bytes4(0x33333333)));

        require(uint256(suint256(dynArr.length)) == 3);
        require(bytes4(dynArr[0]) == bytes4(0x11111111));
        require(bytes4(dynArr[1]) == bytes4(0x22222222));
        require(bytes4(dynArr[2]) == bytes4(0x33333333));

        return true;
    }

    function testArrayOverwrite() public returns (bool) {
        fixedArr[0] = sbytes4(bytes4(0xAAAAAAAA));
        fixedArr[1] = sbytes4(bytes4(0xBBBBBBBB));

        // Overwrite element 0
        fixedArr[0] = sbytes4(bytes4(0xDDDDDDDD));
        require(bytes4(fixedArr[0]) == bytes4(0xDDDDDDDD));
        // Element 1 unchanged
        require(bytes4(fixedArr[1]) == bytes4(0xBBBBBBBB));

        return true;
    }

    function testDynamicArrayPop() public returns (bool) {
        // Clear from previous tests by pushing fresh values
        while (uint256(suint256(dynArr.length)) > 0) {
            dynArr.pop();
        }

        dynArr.push(sbytes4(bytes4(0xAAAAAAAA)));
        dynArr.push(sbytes4(bytes4(0xBBBBBBBB)));
        require(uint256(suint256(dynArr.length)) == 2);

        dynArr.pop();
        require(uint256(suint256(dynArr.length)) == 1);
        require(bytes4(dynArr[0]) == bytes4(0xAAAAAAAA));

        return true;
    }

    function testDeleteFixedArray() public returns (bool) {
        fixedArr[0] = sbytes4(bytes4(0xAAAAAAAA));
        fixedArr[1] = sbytes4(bytes4(0xBBBBBBBB));
        fixedArr[2] = sbytes4(bytes4(0xCCCCCCCC));

        delete fixedArr;

        require(bytes4(fixedArr[0]) == bytes4(0x00000000));
        require(bytes4(fixedArr[1]) == bytes4(0x00000000));
        require(bytes4(fixedArr[2]) == bytes4(0x00000000));

        return true;
    }
}
// ----
// testFixedArray() -> true
// testDynamicArray() -> true
// testArrayOverwrite() -> true
// testDynamicArrayPop() -> true
// testDeleteFixedArray() -> true
