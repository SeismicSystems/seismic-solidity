contract C {
  function f() public view {
    saddress payable a = saddress(this);
    a;
  }
}
// ----
// TypeError 9574: (46-79): Type saddress is not implicitly convertible to expected type saddress payable.
