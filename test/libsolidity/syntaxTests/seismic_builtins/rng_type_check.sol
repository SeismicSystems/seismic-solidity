// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        suint8 a = rng8();
        suint16 b = rng16();
        suint32 c = rng32();
        suint64 d = rng64();
        suint128 e = rng128();
        suint256 g = rng256();
        a; b; c; d; e; g;
    }
}
// ----
