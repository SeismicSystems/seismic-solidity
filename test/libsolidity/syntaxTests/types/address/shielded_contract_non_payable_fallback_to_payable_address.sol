contract C {
  function f() public view {
    saddress payable a = saddress(this);
    a;
  }
  fallback() external {
  }
}
// ----
// TypeError 9574: (46-81): Type saddress is not implicitly convertible to expected type saddress payable.
