contract C {
    sbytes data;

    // Internal returns should be allowed
    function internalReturn() internal view returns (sbytes storage) {
        return data;
    }

    // Private returns should be allowed
    function privateReturn() private view returns (sbytes storage) {
        return data;
    }

    // External returns should be rejected
    function externalReturn() external view returns (sbytes memory) {
        return data;
    }

    // Public returns should be rejected
    function publicReturn() public view returns (sbytes memory) {
        return data;
    }
}
// ----
// TypeError 7492: (406-419): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// TypeError 7492: (541-554): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
