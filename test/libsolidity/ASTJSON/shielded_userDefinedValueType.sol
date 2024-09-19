type MyAddress is address;
type MyUInt is suint;
function f() {
    MyAddress a;
    MyUInt b;
}
contract C {
    type MyAddress is address;
    type MyUInt is suint;
    mapping(MyAddress => MyUInt) public m;
}

// ----
