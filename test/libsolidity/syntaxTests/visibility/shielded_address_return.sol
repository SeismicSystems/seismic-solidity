contract Deployer {
    saddress private storedAddress;

    function getStoredAddress() internal view returns (saddress) {
        return storedAddress;
    }

    function getStoredAddressPrivate() private view returns (saddress) {
        return storedAddress;
    }

    function getStoredAddressFailExternal() external returns (saddress) {
        return storedAddress;
    }

    function getStoredAddressFail() public returns (saddress) {
        return storedAddress;
    }
}
// ----
// TypeError 7492: (333-341): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 7492: (434-442): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
