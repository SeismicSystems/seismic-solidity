contract Deployer {
    sbool private storedBoolean;

    function getStoredBoolean() internal view returns (sbool) {
        return storedBoolean;
    }

    function getStoredBooleanPrivate() private view returns (sbool) {
        return storedBoolean;
    }

    function getStoredBooleanFailExternal() external returns (sbool) {
        return storedBoolean;
    }

    function getStoredBooleanFailPublic() public returns (sbool) {
        return storedBoolean;
    }
}
// ----
// TypeError 10102: (324-329): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 10102: (428-433): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
