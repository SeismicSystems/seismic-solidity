contract C {
    suint256 private secret;
    uint256 public pub;
    function returnLeak() external view returns (uint256) { return uint256(secret); }
    function storageLeak() external { pub = uint256(secret); }
    function ternaryLeak(bool c) external view returns (uint256) { return c ? uint256(secret) : 0; }
    function arithLeak() external view returns (uint256) { return uint256(secret) + 0; }
    function reshieldNoLeak() external { secret = suint256(uint256(secret)); }
}
// ----
// Warning 10313: (133-148): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (196-211): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (293-308): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (382-397): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
