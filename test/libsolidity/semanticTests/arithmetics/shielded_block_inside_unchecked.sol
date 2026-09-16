contract C {
  function f() public returns (uint y) {
    unchecked{{
        suint max = type(suint).max;
        suint x = max + suint(1);
        y = uint(x);
    }}
  }
}
// ----
// f() -> 0x00
