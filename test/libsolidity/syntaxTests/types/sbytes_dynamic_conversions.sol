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

    function testSbytesToSbytesNN(sbytes memory m) internal view {
        // sbytes -> sbytesNN allowed from memory, rejected from storage (needs a shielded read)
        sbytes32 ok = sbytes32(m);
        sbytes32 x = sbytes32(sdata);
        ok; x;
    }

    function testSbytesToBytesNN() internal view {
        // sbytes -> bytesNN should NOT be allowed (cross-shielding)
        bytes32 y = bytes32(sdata);
    }
}
// ----
// Warning 10305: (17-29): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9574: (184-210): Type sbytes storage ref is not implicitly convertible to expected type bytes storage pointer. Cannot mix shielded and non-shielded storage byte arrays: a reference into shielded storage is not interchangeable with a plain bytes/string storage reference.
// TypeError 9574: (220-247): Type bytes storage ref is not implicitly convertible to expected type sbytes storage pointer.
// TypeError 9640: (687-702): Explicit type conversion not allowed from "sbytes storage ref" to "sbytes32". Conversion of a shielded byte array in storage to a fixed shielded-bytes type is not supported; copy it to memory first (e.g. sbytesN(sbytes memory)).
// TypeError 9640: (866-880): Explicit type conversion not allowed from "sbytes storage ref" to "bytes32".
