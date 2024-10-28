contract C {
    suint[] data;

    function len() public returns (suint ret) {
        data.push(234);
        data.push(123);
        delete data;
        assembly {
            ret := cload(data.slot)
        }
    }

    function val() public returns (suint ret) {
        assembly {
            cstore(0, 2)
            mstore(0, 0)
            cstore(keccak256(0, 32), 234)
            cstore(add(keccak256(0, 32), 1), 123)
        }

        assert(data[0] == 234);
        assert(data[1] == 123);

        delete data;

        suint size = 999;

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

