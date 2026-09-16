// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract C {
    suint256[3] private smallArray;
    suint256[10] private largeArray;
    saddress[4] private saddrs;

    function clearSmall() public {
        delete smallArray;
    }

    function clearLarge() public {
        delete largeArray;
    }

    function clearAddrs() public {
        delete saddrs;
    }
}
