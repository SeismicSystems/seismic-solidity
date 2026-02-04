contract C {
    suint[] data;

    function len() public returns (uint ret) {
        data.push(suint(234));
        data.push(suint(123));
        delete data;
        assembly {
            ret := sload(data.slot)
        }
    }

    function val() public returns (uint ret) {
        assembly {
            sstore(0, 2)
            mstore(0, 0)
            cstore(keccak256(0, 32), 234)
            cstore(add(keccak256(0, 32), 1), 123)
        }

        assert(bool(data[0] == suint(234)));
        assert(bool(data[1] == suint(123)));

        delete data;

        suint size = suint(999);

        assembly {
            size := cload(0)
            mstore(0, 0)
            ret := cload(keccak256(0, 32))
        }
    }
}
// ----
// len() -> 0
// val() -> 0

