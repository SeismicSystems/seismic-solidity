contract ManualSlotPacking {
    // Use a deterministic slot derived from a namespace string to avoid collisions.
    // keccak256("ManualSlotPacking.packed") = a fixed slot number.

    function _packedSlot() internal pure returns (uint256 s) {
        assembly {
            s := keccak256(0, 0)  // placeholder, we use a constant below
        }
        // Use a constant derived from a namespace to avoid storage collisions.
        s = uint256(keccak256("ManualSlotPacking.packed"));
    }

    function packTwo(suint128 a, suint128 b) public {
        uint256 slot = _packedSlot();
        assembly {
            let packed := or(shl(128, a), and(b, 0xffffffffffffffffffffffffffffffff))
            cstore(slot, packed)
        }
    }

    function unpackTwo() public view returns (uint128, uint128) {
        uint256 slot = _packedSlot();
        uint256 packed;
        assembly {
            packed := cload(slot)
        }
        uint128 a = uint128(packed >> 128);
        uint128 b = uint128(packed);
        return (a, b);
    }
}
// ----
// packTwo(suint128,suint128): 42, 99 ->
// unpackTwo() -> 42, 99
// packTwo(suint128,suint128): 1000, 2000 ->
// unpackTwo() -> 1000, 2000
