contract C {
    function internal_func(sbytes memory data) internal pure {
        data;
    }
    
    function private_func(sbytes storage data) private pure {
        data;
    }
    
    function public_func(sbytes memory data) public pure {
        data;
    }
    
    function external_func(sbytes memory data) external pure {
        data;
    }
}
// ----