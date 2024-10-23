// This tests the optimizer rule
// byte(A, shl(B, X))
// ->
// byte(A + B / 8, X)
// given A <= 32 && B % 8 == 0 && B <= 256
//
// and the respective rule about shr
contract C {
  function f(suint a) public returns (suint, suint, suint) {
    suint x = a << (256 - 8);
    assembly {
      x := byte(0, x)
    }
    suint y = a << 8;
    assembly {
      y := byte(30, y)
    }
    suint z = a << 16;
    assembly {
      z := byte(1, z)
    }
    return (x, y, z);
  }
  function g(suint a) public returns (suint, suint, suint) {
    suint x = a >> (256 - 16);
    assembly {
      x := byte(31, x)
    }
    suint y = a >> 8;
    assembly {
      y := byte(4, y)
    }
    suint z = a >> 16;
    assembly {
      z := byte(7, z)
    }
    return (x, y, z);
  }
}
// ----
// f(suint256): 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f -> 0x1f, 0x1f, 3
// g(suint256): 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f -> 1, 3, 5

