// delete on a dynamic sbytes must clear only ceil(len/32) data slots, like a plain
// bytes array (sbytes packs 32 bytes per confidential slot). The legacy clear loop
// derived no element->slot count for the shielded byte element (storageBytes() == 32
// falls through every branch of ArrayUtils::convertLengthToSize), so it iterated once
// per byte and cstore-claimed ~32x as many slots as the array occupies. Every slot
// past the array then becomes confidential, and a later public sstore to it reverts.
//
// `data` lives at slot 0; its long-array payload starts at keccak256(bytes32(0)):
//   keccak256(bytes32(0))      = 18569430475105882587588266137607568536673111973893317399460219858819262702947
//   keccak256(bytes32(0)) + 32 = 18569430475105882587588266137607568536673111973893317399460219858819262702979
// 64 bytes occupy 2 data slots (offsets 0 and 1); offset 32 is well past the array.
// publicWritable() probes whether a slot is still public by attempting a public sstore
// through an external call and catching the cross-domain revert.
contract C {
    sbytes data;

    function setup() external {
        for (uint256 i = 0; i < 64; i++)
            data.push(sbytes1(0xAB));
    }

    function del() external {
        delete data;
    }

    function publicWritable(uint256 slot) external returns (bool) {
        try this.pubWrite(slot) {
            return true;
        } catch {
            return false;
        }
    }

    function pubWrite(uint256 slot) external {
        assembly { sstore(slot, 1) }
    }
}
// ----
// setup() ->
// del() ->
// publicWritable(uint256): 18569430475105882587588266137607568536673111973893317399460219858819262702947 -> false
// publicWritable(uint256): 18569430475105882587588266137607568536673111973893317399460219858819262702979 -> true
