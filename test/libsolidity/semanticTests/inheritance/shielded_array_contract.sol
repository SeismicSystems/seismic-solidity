pragma solidity ^0.8.0;

contract SimpleContract {
    // Placeholder
}

contract DeployerArrayToggling {
    SimpleContract[3] public contracts;

    address public publicAddress;
    saddress privateAddress;

    function setUp(address _publicAddress, saddress _privateAddress) public {
        publicAddress = _publicAddress;
        privateAddress = _privateAddress;
    }

    //function testAllPrivate() public {
    //    // Set all to private
    //    for (uint i = 0; i < 3; i++) {
    //        contracts[i] = SimpleContract(privateAddress);
    //    }

    //    // Verify using cload
    //    for (uint i = 0; i < 3; i++) {
    //        uint baseSlot;
    //        uint elementSlot;
    //        uint loadedWord;
    //        assembly {
    //            baseSlot := contracts.slot
    //            elementSlot := add(baseSlot,i)
    //            loadedWord := cload(elementSlot)
    //        }
    //        saddress loaded = saddress(uint160(loadedWord));
    //        require(loaded == privateAddress, "Private load mismatch");
    //    }
    //}

    function testAllPrivateWorking() public {
        // Set all to private
        contracts[0] = SimpleContract(privateAddress);
        contracts[1] = SimpleContract(privateAddress);
        contracts[2] = SimpleContract(privateAddress);

        {
            uint baseSlot;
            uint elementSlot0;
            uint elementSlot1;
            uint elementSlot2;
            uint loadedWord0;
            uint loadedWord1;
            uint loadedWord2;
            assembly {
                baseSlot := contracts.slot
                elementSlot0 := add(baseSlot, 0)
                elementSlot1 := add(baseSlot, 1)
                elementSlot2 := add(baseSlot, 2)
                loadedWord0 := cload(elementSlot0)
                loadedWord1 := cload(elementSlot1)
                loadedWord2 := cload(elementSlot2)
            }
            saddress loaded0 = saddress(uint160(loadedWord0));
            saddress loaded1 = saddress(uint160(loadedWord1));
            saddress loaded2 = saddress(uint160(loadedWord2));
            require(loaded0 == privateAddress, "Public load mismatch 0");
            require(loaded1 == privateAddress, "Public load mismatch 1");
            require(loaded2 == privateAddress, "Public load mismatch 2");
        }
    }

    function testAllPublicThenPrivate() public {
        // All public
        contracts[0] = SimpleContract(publicAddress);
        contracts[1] = SimpleContract(publicAddress);
        contracts[2] = SimpleContract(publicAddress);

        // Verify public with sload
        {
            uint baseSlot;
            uint elementSlot0;
            uint elementSlot1;
            uint elementSlot2;
            uint loadedWord0;
            uint loadedWord1;
            uint loadedWord2;
            assembly {
                baseSlot := contracts.slot
                elementSlot0 := add(baseSlot, 0)
                elementSlot1 := add(baseSlot, 1)
                elementSlot2 := add(baseSlot, 2)
                loadedWord0 := sload(elementSlot0)
                loadedWord1 := sload(elementSlot1)
                loadedWord2 := sload(elementSlot2)
            }
            address loaded0 = address(uint160(loadedWord0));
            address loaded1 = address(uint160(loadedWord1));
            address loaded2 = address(uint160(loadedWord2));
            require(loaded0 == publicAddress, "Public load mismatch 0");
            require(loaded1 == publicAddress, "Public load mismatch 1");
            require(loaded2 == publicAddress, "Public load mismatch 2");
        }
    }

    //function testMixed() public {
    //    // Index 0 public, rest private
    //    contracts[0] = SimpleContract(publicAddress);
    //    for (uint i = 1; i < 3; i++) {
    //        contracts[i] = SimpleContract(privateAddress);
    //    }

    //    uint baseSlot = 0;

    //    // Verify index 0 with sload
    //    {
    //        uint elementSlot = 0; // 0th element
    //        uint256 loadedWord;
    //        assembly {
    //            loadedWord := sload(elementSlot)
    //        }
    //        address loaded = address(uint160(loadedWord));
    //        require(loaded == publicAddress, "Mixed test: public index mismatch");
    //    }

    //    // Verify indices 1-9 with cload
    //    for (uint i = 1; i < 3; i++) {
    //        uint elementSlot = baseSlot + i;
    //        uint256 loadedWord;
    //        assembly {
    //            loadedWord := cload(elementSlot)
    //        }
    //        saddress loaded = saddress(uint160(loadedWord));
    //        require(loaded == privateAddress, "Mixed test: private indices mismatch");
    //    }
    //}
}
// ----
// setUp(address,saddress): 0x1212121212121212121212121212120000000012, 0x1212121212121212121212121212120000000013
// testAllPrivate() ->
// testAllPublicThenPrivateWorking() ->
