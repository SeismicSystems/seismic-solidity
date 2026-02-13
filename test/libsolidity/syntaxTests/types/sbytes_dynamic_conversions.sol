contract C {
    sbytes sdata;
    bytes bdata;

    function testImplicitConversion() internal {
        // sbytes should NOT be implicitly convertible to bytes or vice versa
        bytes storage ref1 = sdata;
        sbytes storage ref2 = bdata;
    }

    function testExplicitConversion() internal {
        // sbytes SHOULD be explicitly convertible to bytes and vice versa
        bytes memory b = bytes(sdata);
        sbytes memory s = sbytes(bdata);
    }

    function testSbytesToSbytesNN() internal view {
        // sbytes -> sbytesNN should be allowed (like bytes -> bytesNN)
        sbytes32 x = sbytes32(sdata);
    }

    function testSbytesToBytesNN() internal view {
        // sbytes -> bytesNN should NOT be allowed (cross-shielding)
        bytes32 y = bytes32(sdata);
    }
}
// ----
// Warning 9665: (17-29): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9574: (184-210): Type sbytes storage ref is not implicitly convertible to expected type bytes storage pointer.
// TypeError 9574: (220-247): Type bytes storage ref is not implicitly convertible to expected type sbytes storage pointer.
// TypeError 9640: (776-790): Explicit type conversion not allowed from "sbytes storage ref" to "bytes32".
