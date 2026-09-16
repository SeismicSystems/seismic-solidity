contract C {
    struct S {
        saddress payable a;
        saddress payable[] b;
        mapping(uint => saddress payable) c;
        mapping(uint => saddress payable[]) d;
    }
}
// ----
