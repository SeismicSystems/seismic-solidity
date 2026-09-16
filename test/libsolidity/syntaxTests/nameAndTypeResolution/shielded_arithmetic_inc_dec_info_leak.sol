contract C {
    function f() public pure {
        suint256 a = suint256(1);
        a++;
        a--;
        ++a;
        --a;
    }
}
// ----
// Warning 10403: (65-76): Literals converted to shielded integers will leak during contract deployment.
// Warning 10302: (86-89): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 10302: (99-102): Shielded integer decrement can leak information. A revert due to overflow reveals range information about the operand.
// Warning 10302: (112-115): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 10302: (125-128): Shielded integer decrement can leak information. A revert due to overflow reveals range information about the operand.
