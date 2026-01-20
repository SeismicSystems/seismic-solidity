contract C {
    saddress[] s;
    event E(address[]);

    function emit_shielded() external {
        emit E(s);
    }
}
// ----
// TypeError 7407: (105-106): Type saddress[] storage ref is not implicitly convertible to expected type address[] memory.
