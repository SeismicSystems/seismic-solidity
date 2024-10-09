contract C {
  function f() public pure returns (C c) {
    saddress a = saddress(2);
    c = C(a);
  }
  receive() external payable {
  }
}
// ----
// TypeError 7398: (94-98): Explicit type conversion not allowed from non-payable "saddress" to "contract C", which has a payable fallback function.
