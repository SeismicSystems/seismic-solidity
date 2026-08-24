contract C {
  function f() public view {
    saddress payable a = this;
    a;
  }
  fallback() external payable {
  }
}
// ----
// Warning 3628: (0-121): This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
// TypeError 9574: (46-71): Type contract C is not implicitly convertible to expected type saddress payable.
