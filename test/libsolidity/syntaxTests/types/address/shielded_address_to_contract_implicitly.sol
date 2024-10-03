contract C {
  function f() public view {
    C c = saddress(2);
  }
}
// ----
// TypeError 9574: (46-63): Type saddress is not implicitly convertible to expected type contract C.
