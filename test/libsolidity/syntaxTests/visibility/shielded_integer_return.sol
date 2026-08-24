contract Deployer {
    sint private storedInteger;

    function getStoredInteger() internal view returns (sint) {
        return storedInteger;
    }

    function getStoredIntegerPrivate() private view returns (sint) {
        return storedInteger;
    }

    function getStoredIntegerFailExternal() external returns (sint) {
        return storedInteger;
    }

    function getStoredIntegerFailPublic() public returns (sint) {
        return storedInteger;
    }
}
// ----
// TypeError 10102: (321-325): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 10102: (424-428): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
