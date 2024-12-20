pragma abicoder               v2;


contract C {
    function f(sbool _b) public returns (uint256) {
        if (_b) return 1;
        else return 0;
    }

    function g(sbool _in) public returns (bool _out) {
        _out = bool(_in);
    }
}
// ----
// f(sbool): 0x0 -> 0x0
// f(sbool): 0x1 -> 0x1
// f(sbool): 0x2 -> FAILURE
// f(sbool): 0x3 -> FAILURE
// f(sbool): 0xff -> FAILURE
// g(sbool): 0x0 -> 0x0
// g(sbool): 0x1 -> 0x1
// g(sbool): 0x2 -> FAILURE
// g(sbool): 0x3 -> FAILURE
// g(sbool): 0xff -> FAILURE

