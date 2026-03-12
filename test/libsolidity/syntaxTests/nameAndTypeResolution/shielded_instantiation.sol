// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
contract SimpleContract {
}

contract InstantiationFail {
    SimpleContract contracts;
    function instantiate(saddress _contractAddress) public  {
        contracts = SimpleContract(_contractAddress);
    }
}
// ----
// TypeError 10204: (234-266): Instantiating a contract with a saddress is not yet supported
