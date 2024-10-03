contract C {
  function f() public pure returns (C c) {
    c = C(payable(saddress(2)));
  }
  receive() external payable {
  }
}
// ----
