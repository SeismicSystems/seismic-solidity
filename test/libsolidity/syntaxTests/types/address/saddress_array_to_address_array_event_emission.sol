contract C {
    saddress[] s;
    event E(address[]);

    function emit_shielded() external {
        emit E(s);
    }
}
// ----
// TypeError 9553: (111-112): Invalid type for argument in function call. Invalid implicit conversion from saddress[] storage ref to address[] memory requested.
