contract c {
    function bignum() public {
        suint256 a;
        a = suint(1e1233 / 1e1233); // 1e1233 is still fine
        a = 1e1234; // 1e1234 is too big
    }
}
// ----
// TypeError 2826: (136-142): Invalid literal value.
