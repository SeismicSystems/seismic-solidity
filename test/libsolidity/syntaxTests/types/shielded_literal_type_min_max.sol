contract C {
    suint8 private a;
    suint256 private b;
    sint8 private c;
    sint256 private d;

    function test() internal {
        // type().max and type().min with shielded types
        a = type(suint8).max;
        b = type(suint256).max;
        c = type(sint8).min;
        d = type(sint256).min;
    }
}
// ----
