contract c {
    function bignum() public {
        suint a;
        a = 134562324532464234452335168163516E1200 / 134562324532464234452335168163516E1200; // still fine
        a = 1345623245324642344523351681635168E1200; // too large
    }
}
// ----
// TypeError 2826: (180-219): Invalid literal value.
