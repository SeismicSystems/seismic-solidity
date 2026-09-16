// Constructor with multiple shielded params — each should warn
contract C {
    suint256 private a;
    sbool private b;
    saddress private c;
    constructor(suint256 _a, sbool _b, saddress _c) {
        a = _a;
        b = _b;
        c = _c;
    }
}
// ----
// Warning 10103: (164-175): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10103: (177-185): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
// Warning 10103: (187-198): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead. This is expected to be fixed in a future release.
