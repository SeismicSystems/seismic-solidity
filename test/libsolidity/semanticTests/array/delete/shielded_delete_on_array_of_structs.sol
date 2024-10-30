contract C {
    struct S {
        suint256 x;
        suint256[] y;
    }
    S[] data;

    function f() public returns (bool) {
        S storage s1 = data.push();
        s1.x = suint256(2**200);
        S storage s2 = data.push();
        s2.x = suint256(2**200);
        data.pop();
        delete data;
        return true;
    }
}
// ----
// f() -> true
