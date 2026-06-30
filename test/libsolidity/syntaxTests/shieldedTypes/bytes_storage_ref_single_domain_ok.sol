// Negative control: single-domain storage references must keep compiling. Only a mix of
// public and shielded sources is rejected (see bytes_storage_ref_conflicting_domain.sol).
contract C {
    bytes public pubA;
    bytes public pubB;
    sbytes private secretA;
    sbytes private secretB;

    function allPublicBranch(bool which) external {
        bytes storage r;
        if (which) { r = pubA; }
        else { r = pubB; }
        r.push(0x42);
    }

    function allShieldedReassign() external {
        bytes storage r = bytes(secretA);
        r = bytes(secretB);
        r.push(0x42);
    }
}
// ----
// Warning 10305: (243-265): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 10305: (271-293): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
