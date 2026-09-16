contract C {
  struct S {
    suint256 a;
  }

  function f() external returns (uint) {
    S memory s = S(suint256(1));
    return uint256(s.a);
  }
}
// ----
// f() -> 1
