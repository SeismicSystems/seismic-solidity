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
// TypeError 10113: (621-641): A bytes/string storage reference aliasing shielded storage cannot be returned. Return the shielded type (sbytes storage) or a memory copy (bytes memory) instead.
