// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {
    function mint(address to, suint256 amount) external;
}

contract Script {
    // Literal as arg to external call on contract — should NOT warn
    function run(IToken token) external {
        token.mint(msg.sender, suint256(2e27));
    }
}
