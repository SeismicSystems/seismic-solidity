contract C {
    saddress[] data;

    function len() public returns (uint ret) {
        data.push(saddress(address(0xBEEF)));
        data.push(saddress(address(0xCAFE)));
        delete data;
        assembly {
            ret := cload(data.slot)
        }
    }

    function val() public returns (uint lenAfter, uint elemAfter) {
        assembly {
            cstore(0, 2)
            mstore(0, 0)
            cstore(keccak256(0, 32), 0xBEEF)
            cstore(add(keccak256(0, 32), 1), 0xCAFE)
        }

        assert(bool(data[0] == saddress(address(0xBEEF))));
        assert(bool(data[1] == saddress(address(0xCAFE))));

        delete data;

        assembly {
            lenAfter := cload(0)
            mstore(0, 0)
            elemAfter := cload(keccak256(0, 32))
        }
    }
}
// ----
// len() -> 0
// val() -> 0, 0
