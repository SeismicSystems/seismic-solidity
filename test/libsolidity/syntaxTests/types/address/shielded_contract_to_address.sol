contract C {
  function f() public view {
    saddress a = saddress(this);
    a;
  }
}
// ----
