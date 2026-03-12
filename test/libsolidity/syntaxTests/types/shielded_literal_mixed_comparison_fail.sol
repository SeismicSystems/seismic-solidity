contract C {
    function test() internal {
        // Comparing shielded literal with non-shielded should fail
        bool a = (1s == 1);
        bool b = (2 > 1s);
        bool c = (1s != 2);
    }
}
// ----
// Warning 10416: (130-132): Shielded number literals will leak during contract deployment.
// TypeError 2271: (130-137): Built-in binary operator == cannot be applied to types shielded_int_const 1 and int_const 1.
// TypeError 9574: (120-138): Type sbool is not implicitly convertible to expected type bool.
// Warning 10416: (162-164): Shielded number literals will leak during contract deployment.
// TypeError 2271: (158-164): Built-in binary operator > cannot be applied to types int_const 2 and shielded_int_const 1.
// Warning 10416: (185-187): Shielded number literals will leak during contract deployment.
// TypeError 2271: (185-192): Built-in binary operator != cannot be applied to types shielded_int_const 1 and int_const 2.
// TypeError 9574: (175-193): Type sbool is not implicitly convertible to expected type bool.
