pragma solidity ^0.8.0;

contract SimpleContract {
    uint256 public value;

    function setValue(uint256 _value) public {
        value = _value;
    }
}

contract Deployer {
    saddress private storedAddress;
    SimpleContract private storedSimpleContract;

    function deployContract() public returns (address) {
        SimpleContract sc = new SimpleContract();
        storedAddress = saddress(sc);
        return address(storedAddress);
    }

    function deployContractAndStoreAsContract() public returns (address) {
        SimpleContract sc = new SimpleContract();
        storedSimpleContract = SimpleContract(saddress(sc));
        return address(storedSimpleContract);
    }

    function getStoredAddress() internal returns (saddress) {
        return storedAddress;
    }
}

