contract C {
  function f() public pure returns (C c) {
    saddress a = saddress(2);
    c = C(a);
  }
  fallback() external payable {
  }
}
// ----
// Warning 3628: (0-141): This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
// TypeError 7398: (94-98): Explicit type conversion not allowed from non-payable "saddress" to "contract C", which has a payable fallback function.
