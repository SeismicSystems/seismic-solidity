// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.0;

contract Blah {
    sbytes data;

    function pushAndRead() external {
        data.push(sbytes1(0xAA));
        data.push(sbytes1(0xBB));
        sbytes1 val = data[0];
    }
}
