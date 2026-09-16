// A bytes(sbytesRef) alias relies on a side-marker to stay shielded; carrying it across a
// function return is order-dependent and miscompiles when the callee is defined below its
// caller. Reject it; the sound forms are sbytes storage (intrinsic) or bytes memory (a copy).
contract C {
    sbytes private secret;
    bytes private pub;

    // caller above callee (the forward-reference miscompile shape).
    function exploit() external view returns (uint256) {
        bytes storage r = getSecretAlias();
        return r.length;
    }

    function getSecretAlias() internal view returns (bytes storage) {
        return bytes(secret); // rejected: shielded bytes-storage alias return
    }

    // implicit return via named return parameter (no `return` statement) must also be rejected.
    function getSecretImplicit() internal view returns (bytes storage r) {
        r = bytes(secret);
    }

    // sound: intrinsic shielded type, order-independent.
    function getSecretShielded() internal view returns (sbytes storage) {
        return secret;
    }

    // sound: public storage ref.
    function getPublic() internal view returns (bytes storage) {
        return pub;
    }

    // sound: memory copy reveal.
    function reveal() internal view returns (bytes memory) {
        return bytes(secret);
    }
}
// ----
// Warning 10305: (294-315): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10313: (628-641): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// TypeError 10113: (596-609): A bytes/string storage reference aliasing shielded storage cannot be returned. Return the shielded type (sbytes storage) or a memory copy (bytes memory) instead.
// TypeError 10113: (852-867): A bytes/string storage reference aliasing shielded storage cannot be returned. Return the shielded type (sbytes storage) or a memory copy (bytes memory) instead.
// Warning 10313: (1303-1316): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
