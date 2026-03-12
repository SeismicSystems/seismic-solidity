contract C {
    event Log(uint256 value);

    function test() internal {
        // Emitting shielded literal in event should fail (shielded types can't be in events)
        emit Log(42s);
    }
}
// ----
// Warning 9667: (186-189): Shielded number literals will leak during contract deployment.
// TypeError 9553: (186-189): Invalid type for argument in function call. Invalid implicit conversion from shielded_int_const 42 to uint256 requested. Shielded number literal cannot be implicitly converted to non-shielded type.
