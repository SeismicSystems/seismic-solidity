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
// Warning 10313: (94-98): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
