contract C {
    function f(sbool a, sbool b) public pure {
        sbool c;
        // OK
        c = !a;
        c = !b;
        c = a == b;
        c = a != b;
        c = a || b;
        c = a && b;

        // Not OK
        c = a > b;
        c = a < b;
        c = a >= b;
        c = a <= b;
        c = a & b;
        c = a | b;
        c = a ^ b;
        c = ~a;
        c = ~b;
        c = a + b;
        c = a - b;
        c = -a;
        c = -b;
        c = a * b;
        c = a / b;
        c = a ** b;
        c = a % b;
        c = a << b;
        c = a >> b;
    }
}
// ----
// Warning 10316: (175-181): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// Warning 10316: (195-201): Using shielded types in branching conditions can leak information through observable execution patterns such as gas costs, state changes, and execution traces.
// TypeError 2271: (234-239): Built-in binary operator > cannot be applied to types sbool and sbool.
// TypeError 2271: (253-258): Built-in binary operator < cannot be applied to types sbool and sbool.
// TypeError 2271: (272-278): Built-in binary operator >= cannot be applied to types sbool and sbool.
// TypeError 2271: (292-298): Built-in binary operator <= cannot be applied to types sbool and sbool.
// TypeError 2271: (312-317): Built-in binary operator & cannot be applied to types sbool and sbool.
// TypeError 2271: (331-336): Built-in binary operator | cannot be applied to types sbool and sbool.
// TypeError 2271: (350-355): Built-in binary operator ^ cannot be applied to types sbool and sbool.
// TypeError 4907: (369-371): Built-in unary operator ~ cannot be applied to type sbool.
// TypeError 4907: (385-387): Built-in unary operator ~ cannot be applied to type sbool.
// TypeError 2271: (401-406): Built-in binary operator + cannot be applied to types sbool and sbool.
// TypeError 2271: (420-425): Built-in binary operator - cannot be applied to types sbool and sbool.
// TypeError 4907: (439-441): Built-in unary operator - cannot be applied to type sbool.
// TypeError 4907: (455-457): Built-in unary operator - cannot be applied to type sbool.
// TypeError 2271: (471-476): Built-in binary operator * cannot be applied to types sbool and sbool.
// TypeError 2271: (490-495): Built-in binary operator / cannot be applied to types sbool and sbool.
// TypeError 2271: (509-515): Built-in binary operator ** cannot be applied to types sbool and sbool.
// TypeError 2271: (529-534): Built-in binary operator % cannot be applied to types sbool and sbool.
// TypeError 2271: (548-554): Built-in binary operator << cannot be applied to types sbool and sbool.
// TypeError 2271: (568-574): Built-in binary operator >> cannot be applied to types sbool and sbool.
