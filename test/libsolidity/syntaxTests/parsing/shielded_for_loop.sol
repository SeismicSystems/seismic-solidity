contract TestForSbool {
    function f(sbool condition, suint counter, suint limit) public pure returns (uint) {
        for (; condition; ) {
            counter++;
            if (counter == limit) {
                break;
            }
        }
        return uint(counter);
    }
}
// ----
// Warning 4283: (155-164): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
