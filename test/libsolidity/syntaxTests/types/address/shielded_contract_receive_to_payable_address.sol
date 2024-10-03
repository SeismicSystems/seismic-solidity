contract C {
  function f() public view {
    saddress payable a = payable(this);
    a;
  }
  receive() external payable {
  }
}
// ----
