// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    suint256 private _supply;
    constructor(suint256 initialSupply) {
        _supply = initialSupply;
    }
}

contract Deployer {
    // new expression — SHOULD warn
    function deploy() external {
        new Token(suint256(1000));
    }
}
