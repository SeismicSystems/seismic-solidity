// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    function f() public view {
        suint8 a = sync_rng8();
        suint16 b = sync_rng16();
        suint32 c = sync_rng32();
        suint64 d = sync_rng64();
        suint128 e = sync_rng128();
        suint256 g = sync_rng256();
        a; b; c; d; e; g;
    }
}
// ----
