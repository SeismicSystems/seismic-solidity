contract C {
  function f() public view {
    saddress payable a = this;
    a;
  }
  receive() external payable {
  }
}
// ----
// TypeError 9574: (46-70): Type contract C is not implicitly convertible to expected type saddress payable.
