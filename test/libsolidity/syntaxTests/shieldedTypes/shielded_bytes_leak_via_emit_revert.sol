contract C {
    sbytes private secret;
    bytes private publicBytes;
    event Log(bytes data);
    event LogTwo(uint256 a, bytes data);
    error E(bytes data);

    // Positive cases — should warn (10313).
    function leakEmit() external {
        emit Log(bytes(secret));
    }
    function leakRevertCustom() external {
        revert E(bytes(secret));
    }
    function leakRevertString() external {
        revert(string(bytes(secret)));
    }
    function leakRequireString(bool cond) external pure {
        require(cond, string(bytes(secret)));
    }
    function leakEmitNested() external {
        emit Log(abi.encode(bytes(secret)));
    }
    function leakEmitSecondArg() external {
        emit LogTwo(1, bytes(secret));
    }

    // Negative cases — should NOT warn.
    function noWarnLiteral() external {
        emit Log("hello");
    }
    function noWarnPublicConversion() external {
        emit Log(abi.encodePacked(uint256(7)));
    }
    function noWarnPublicBytes() external {
        emit Log(publicBytes);
    }
    function noWarnPlainRevert() external pure {
        revert("plain message");
    }
}
// ----
// Warning 10305: (17-38): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10313: (264-277): Converting a shielded value to a public type within an emit or revert leaks the value to public logs or returndata.
// Warning 10313: (346-359): Converting a shielded value to a public type within an emit or revert leaks the value to public logs or returndata.
// Warning 10313: (433-446): Converting a shielded value to a public type within an emit or revert leaks the value to public logs or returndata.
// Warning 10313: (543-556): Converting a shielded value to a public type within an emit or revert leaks the value to public logs or returndata.
// TypeError 10202: (635-648): Shielded types cannot be ABI encoded.
// Warning 10313: (635-648): Converting a shielded value to a public type within an emit or revert leaks the value to public logs or returndata.
// Warning 10313: (725-738): Converting a shielded value to a public type within an emit or revert leaks the value to public logs or returndata.
