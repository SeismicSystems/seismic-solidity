pragma solidity ^0.8.0;

contract SimpleContract {
}

contract Deployer {
    saddress private storedAddress;
    SimpleContract private storedSimpleContract;

    function setUp(saddress _storedAddress, saddress _simpleContract) public {
        storedAddress = _storedAddress;
        storedSimpleContract = SimpleContract(_simpleContract);
    }

    function checkAddress() public returns (address loadedAddress) {
        assembly {
            loadedAddress := cload(storedAddress.slot)
        }
    }

    function checkAddressDeployedContract() public returns (address loadedAddress) {
        assembly {
            loadedAddress := cload(storedSimpleContract.slot)
        }
    }
}
// ----
// setUp(saddress,saddress): 0x1212121212121212121212121212120000000012, 0x1212121212121212121212121212120000000013
// checkAddress() -> 0x1212121212121212121212121212120000000012
// checkAddressDeployedContract() -> 0x1212121212121212121212121212120000000013
