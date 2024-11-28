contract Deployer {
    saddress private storedAddress;

    function getStoredAddress() internal view returns (saddress) {
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
// DeclarationError 7492: (223-231): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// DeclarationError 7492: (324-332): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
