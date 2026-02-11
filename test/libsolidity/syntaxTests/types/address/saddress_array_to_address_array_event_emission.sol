contract C {
    saddress[] s;
    event E(address[]);

    function emit_shielded() external {
        emit E(s);
    }
}
// ----
// Warning 9665: (17-29): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 9553: (111-112): Invalid type for argument in function call. Invalid implicit conversion from saddress[] storage ref to address[] memory requested.
