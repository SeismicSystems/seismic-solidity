contract C {
  function f() public pure returns (C c) {
    c = C(saddress(2));
  }
}
// ----
