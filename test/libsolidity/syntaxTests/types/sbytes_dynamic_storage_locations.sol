contract C {
    sbytes storageData;

    function testCalldata(sbytes calldata cd) internal pure returns (uint256) {
        return 0;
    }

    function testMemory() internal pure {
        sbytes memory m = new sbytes(5);
    }

    function testStorageRef() internal view {
        sbytes storage ref = storageData;
    }
}
// ----
// Warning 10305: (17-35): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 5667: (64-82): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2072: (193-208): Unused local variable.
// Warning 2072: (287-305): Unused local variable.
