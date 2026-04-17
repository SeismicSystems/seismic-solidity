contract C {
  struct I {
    suint256 b;
    suint256 c;
  }
  struct S {
    I a;
  }

  function f() external returns (uint) {
    S memory s = S(I(suint256(1), suint256(2)));
    return uint256(s.a.b);
  }
}
// ----
// f() -> 1
