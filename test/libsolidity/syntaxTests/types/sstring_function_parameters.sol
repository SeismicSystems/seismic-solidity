contract C {
    function internal_func(sstring memory data) internal pure {
        data;
    }
    
    function private_func(sstring storage data) private pure {
        data;
    }
    
    function public_func(sstring memory data) public pure {
        data;
    }
    
    function external_func(sstring memory data) external pure {
        data;
    }
}
// ----