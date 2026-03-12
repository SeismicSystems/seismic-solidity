// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Shielded return types cannot be used in external/public functions.
contract C {
    function getRandom() external view returns (suint256) {
        return sync_rng256();
    }
}
// ----
// TypeError 10102: (188-196): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
