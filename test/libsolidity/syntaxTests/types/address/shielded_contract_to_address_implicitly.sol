contract C {
  function f() public view {
    saddress a = this;
    a;
  }
}
// ----
// TypeError 9574: (46-62): Type contract C is not implicitly convertible to expected type saddress.
