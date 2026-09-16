contract C {
  function f() public view {
    saddress payable a = payable(saddress(this));
    a;
  }
  fallback() external payable {
  }
}
// ----
// Warning 3628: (0-140): This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
