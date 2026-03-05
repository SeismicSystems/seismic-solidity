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
// Warning 9660: (65-76): Literals converted to shielded integers will leak during contract deployment.
// Warning 4283: (86-89): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 4283: (99-102): Shielded integer decrement can leak information. A revert due to overflow reveals range information about the operand.
// Warning 4283: (112-115): Shielded integer increment can leak information. A revert due to overflow reveals range information about the operand.
// Warning 4283: (125-128): Shielded integer decrement can leak information. A revert due to overflow reveals range information about the operand.
