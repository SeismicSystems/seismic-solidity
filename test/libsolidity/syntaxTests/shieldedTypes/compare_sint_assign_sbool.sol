contract C {
    sbool x;
    function f(sint a, sint b) public {
        x = a < b;
    }
}
// ====
// EVMVersion: >=cancun
// ----
