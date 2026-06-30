// A bytes/string storage reference must have one consistent storage domain. If it can alias
// public storage on one path and shielded storage on another, codegen can only pick one
// opcode (cstore/cload vs sstore/sload), so one path is silently wrong. Reject the mix.
contract C {
    bytes public pub;
    sbytes private secret;

    // if/else merge: public on one branch, shielded on the other.
    function mixedBranch(bool which) external {
        bytes storage r;
        if (which) { r = pub; }
        else { r = bytes(secret); }
        r.push(0x42);
    }

    // straight-line reassignment across domains: same unsoundness.
    function mixedReassign() external {
        bytes storage r = pub;
        r = bytes(secret);
        r.push(0x42);
    }
}
// ----
// Warning 10305: (310-331): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 10112: (521-538): This bytes/string storage reference aliases both shielded and non-shielded storage on different paths. A storage reference must have a single confidentiality domain, since the compiler selects cstore/cload or sstore/sload for it at compile time.
// TypeError 10112: (718-735): This bytes/string storage reference aliases both shielded and non-shielded storage on different paths. A storage reference must have a single confidentiality domain, since the compiler selects cstore/cload or sstore/sload for it at compile time.
