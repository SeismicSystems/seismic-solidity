pragma abicoder v2;
// Shielded version of copy_from_storage.sol
struct S {
    suint256 x;
}

contract C {
    S sStorage;
    constructor() {
        sStorage.x = suint256(13);
    }

    // Cannot return S[] memory with shielded fields from public function,
    // so return the extracted value instead.
    function f() external returns (uint256) {
        S[] memory sMemory = new S[](1);

        sMemory[0] = sStorage;

        return uint256(sMemory[0].x);
    }
}
// ----
// f() -> 13
