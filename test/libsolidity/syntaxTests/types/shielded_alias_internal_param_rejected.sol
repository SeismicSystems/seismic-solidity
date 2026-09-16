contract C {
    sbytes secret;
    bytes pub;

    // A shielded-storage alias cannot be passed across a function boundary into a plain
    // bytes-storage parameter: one shared body cannot be both shielded and public. Both the
    // single-candidate and overloaded forms are rejected (no silent cstore-on-public leak).
    function takesPublic(bytes storage r) internal view returns (uint256) { return r.length; }

    function single() external view returns (uint256) {
        return takesPublic(bytes(secret));
    }

    function viaLocal() external view returns (uint256) {
        bytes storage r = bytes(secret);
        return takesPublic(r);
    }

    // A plain public alias is fine.
    function publicOk() external view returns (uint256) {
        return takesPublic(pub);
    }
}
// ----
// Warning 10305: (17-30): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9553: (502-515): Invalid type for argument in function call. Invalid implicit conversion from bytes storage pointer to bytes storage pointer requested. Cannot mix shielded and non-shielded storage byte arrays: a reference into shielded storage is not interchangeable with a plain bytes/string storage reference.
// Warning 10313: (502-515): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// TypeError 9553: (651-652): Invalid type for argument in function call. Invalid implicit conversion from bytes storage pointer to bytes storage pointer requested. Cannot mix shielded and non-shielded storage byte arrays: a reference into shielded storage is not interchangeable with a plain bytes/string storage reference.
