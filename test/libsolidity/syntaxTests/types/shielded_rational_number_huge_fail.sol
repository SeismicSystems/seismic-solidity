contract C {
    function f(suint y) public pure {
        // one byte too long for storing in Fixedbytes (would require 33 bytes)
        y = suint(0xffffffff00000000ffffffff00000000ffffffff00000000ffffffff000000001);
    }
}
// ----
// TypeError 9640: (143-217): Explicit type conversion not allowed from "int_const 1852...(71 digits omitted)...7281" to "suint256". Literal is too large to fit in suint256.
