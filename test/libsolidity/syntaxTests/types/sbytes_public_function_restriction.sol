contract C {
    function public_return() public pure returns (sbytes memory) {
        return sbytes("test");
    }
    
    function external_return() external pure returns (sbytes memory) {
        return sbytes("test");
    }
    
    function internal_ok() internal pure returns (sbytes memory) {
        return sbytes("test");
    }
    
    function private_ok() private pure returns (sbytes memory) {
        return sbytes("test");
    }
}
// ----
// DeclarationError 7492: (63-76): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.
// DeclarationError 7492: (176-189): Shielded objects cannot be returned from public or external functions. Use internal or private functions or cast to an unshielded type.