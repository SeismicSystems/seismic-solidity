contract C {
    function public_return() public pure returns (sstring memory) {
        return sstring("test");
    }
    
    function external_return() external pure returns (sstring memory) {
        return sstring("test");
    }
    
    function internal_ok() internal pure returns (sstring memory) {
        return sstring("test");
    }
    
    function private_ok() private pure returns (sstring memory) {
        return sstring("test");
    }
}
// ----
// DeclarationError 7492: (63-77): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// DeclarationError 7492: (178-192): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.