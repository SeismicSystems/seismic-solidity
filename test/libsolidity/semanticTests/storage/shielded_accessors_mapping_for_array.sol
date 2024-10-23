contract test {
    mapping(suint => suint[8]) data;
    mapping(suint => suint[]) dynamicData;
    constructor() {
        data[2][2] = suint(8);
        for (uint i = 0; i < 3; i++)
            dynamicData[2].push();
        dynamicData[2][2] = suint(8);
    }

    function get_data(suint a, uint256 b) public returns (suint) {
        return data[a][b];
    }

    function get_dynamicData(suint a, uint256 b) public returns (suint) {
        return dynamicData[a][b];
    }

    function get_data_assembly(suint a, uint256 b) public returns (suint) {
        assembly {
            // Get the storage slot of the `data` mapping
            let p0 := data.slot

            // Compute the hash for the mapping key `a`
            mstore(0x0, a)
            mstore(0x20, p0)
            let hash := keccak256(0x0, 0x40)

            // Ensure index `b` is within bounds (0 <= b < 8)
            if iszero(lt(b, 8)) {
                revert(0x0, 0x0)
            }

            // Compute the storage slot for `data[a][b]`
            let slot := add(hash, b)

            // Load the value from storage
            let val := cload(slot)

            // Return the value
            mstore(0x0, val)
            return(0x0, 0x20)
        }
    }

    function get_dynamicData_assembly(suint a, uint256 b) public returns (suint) {
        assembly {
            // Get the storage slot of the `dynamicData` mapping
            let p0 := dynamicData.slot

            // Compute the hash for the mapping key `a`
            mstore(0x0, a)
            mstore(0x20, p0)
            let hash := keccak256(0x0, 0x40)

            // Load the length of the dynamic array `dynamicData[a]`
            let len := sload(hash)

            // Ensure index `b` is within bounds (0 <= b < len)
            if iszero(lt(b, len)) {
                // Revert with an error if out of bounds
                revert(0x0, 0x0)
            }

            // Compute the base slot for the array elements
            mstore(0x0, hash)
            let baseSlot := keccak256(0x0, 0x20)

            // Compute the storage slot for `dynamicData[a][b]`
            let slot := add(baseSlot, b)

            // Load the value from storage
            let val := cload(slot)

            // Return the value
            mstore(0x0, val)
            return(0x0, 0x20)
        }
    }
}
// ----
// get_data(suint256,uint256): 2, 2 -> 8
// get_data(suint256,uint256): 2, 8 -> FAILURE # NB: the original code contained a bug here #
// get_dynamicData(suint256,uint256): 2, 2 -> 8
// get_dynamicData(suint256,uint256): 2, 8 -> FAILURE
// get_data_assembly(suint256,uint256): 2, 2 -> 8
// get_dynamicData_assembly(suint256,uint256): 2, 2 -> 8
