pragma solidity ^0.8.0;

contract SimpleContract {
}

contract Deployer {
    address storedAddress;
    SimpleContract private storedSimpleContract;
    saddress storedSimpleContractCopy;

    function setUp(address _storedAddress, saddress _simpleContract) public {
        storedAddress = _storedAddress;
        storedSimpleContract = SimpleContract(_simpleContract);
        storedSimpleContractCopy = _simpleContract;
    }

    function StoreThenLoadThenCStore() public returns (address privateLoad) {
        address publicLoad = publicWriteAndLoad();

        require(storedAddress == publicLoad, "Couldn't switch private address to public");

        privateLoad = privateWriteAndLoad();

        require(address(storedSimpleContractCopy) == privateLoad, "Couldn't switch public address to private");
    }

    function storeThenLoadHighLevel() public {
        require(saddress(storedSimpleContract) == storedSimpleContractCopy, "SimpleContract address mismatch");

        storedSimpleContract = SimpleContract(storedAddress);

        address publicLoad = address(storedSimpleContract);

        require(storedAddress == publicLoad, "Public storage mismatch");

        storedSimpleContract = SimpleContract(storedSimpleContractCopy);

        saddress privateLoad = saddress(storedSimpleContract);

        require(storedSimpleContractCopy == privateLoad, "Public storage mismatch");
    }

    function publicWriteAndLoad() internal returns (address publicLoad) {
        assembly {
            sstore(1, sload(storedAddress.slot))
        }

        assembly {
            publicLoad := sload(1)
        }
    }

    function privateWriteAndLoad() internal returns (address privateLoad) {
        assembly {
            cstore(1, cload(storedSimpleContractCopy.slot))
        }

        assembly {
            privateLoad := cload(1)
        }
    }
}


// ----
// setUp(address,saddress): 0x1212121212121212121212121212120000000012, 0x1212121212121212121212121212120000000013
// StoreThenLoadThenCStore() -> 0x1212121212121212121212121212120000000013
// storeThenLoadHighLevel() ->
