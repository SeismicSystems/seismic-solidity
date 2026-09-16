// Tests ABI encoding of structs with shielded members from storage
// This test exposes a bug where sload was used instead of cload
// in abiEncodingFunctionStruct for shielded struct members
contract C {
    struct Data {
        suint256 secretValue;
        uint256 publicValue;
        suint256 anotherSecret;
    }

    Data stored;

    function setup(uint256 secret1, uint256 pub, uint256 secret2) public {
        stored.secretValue = suint256(secret1);
        stored.publicValue = pub;
        stored.anotherSecret = suint256(secret2);
    }

    function getStored() public view returns (uint256, uint256, uint256) {
        return (
            uint256(stored.secretValue),
            stored.publicValue,
            uint256(stored.anotherSecret)
        );
    }
}
// ----
// getStored() -> 0, 0, 0
// setup(uint256,uint256,uint256): 42, 100, 77 ->
// getStored() -> 42, 100, 77
