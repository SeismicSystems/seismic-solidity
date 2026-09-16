// Assembly access to separate shielded and unshielded storage vars
// (mixed struct base slot triggers compiler error with sload/sstore,
//  so we test with separate variables instead)
contract C {
    uint256 public_val;
    suint256 secret_val;

    function writeViaAssembly() public returns (uint256, uint256) {
        assembly {
            sstore(public_val.slot, 42)
        }
        assembly {
            cstore(secret_val.slot, 99)
        }
        return (public_val, uint256(secret_val));
    }

    function readViaAssembly() public returns (uint256 pub, uint256 sec) {
        public_val = 10;
        secret_val = suint256(20);
        assembly {
            pub := sload(public_val.slot)
            sec := cload(secret_val.slot)
        }
    }

    function deleteAndReadAssembly() public returns (uint256 pub, uint256 sec) {
        public_val = 10;
        secret_val = suint256(20);
        delete public_val;
        delete secret_val;
        assembly {
            pub := sload(public_val.slot)
            sec := cload(secret_val.slot)
        }
    }
}
// ----
// writeViaAssembly() -> 42, 99
// readViaAssembly() -> 10, 20
// deleteAndReadAssembly() -> 0, 0
