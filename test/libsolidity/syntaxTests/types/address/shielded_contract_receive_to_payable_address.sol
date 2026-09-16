contract C {
  function f() public view {
    saddress payable a = payable(saddress(this));
    a;
  }
  receive() external payable {
  }
}
// ----
