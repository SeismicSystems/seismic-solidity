// sbytes -> sbytesN: allowed from a memory/calldata source (plain byte copy),
// rejected from storage (needs a shielded-layout read that is not implemented).
contract C {
    sbytes s;
    function fromMemory(sbytes memory m) internal pure {
        sbytes3 a = sbytes3(m);
        sbytes32 b = sbytes32(m);
        a; b;
    }
    function fromStorage() internal view {
        sbytes8 c = sbytes8(s);
        c;
    }
}
// ----
// Warning 10305: (177-185): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9640: (393-403): Explicit type conversion not allowed from "sbytes storage ref" to "sbytes8". Conversion of a shielded byte array in storage to a fixed shielded-bytes type is not supported; copy it to memory first (e.g. sbytesN(sbytes memory)).
