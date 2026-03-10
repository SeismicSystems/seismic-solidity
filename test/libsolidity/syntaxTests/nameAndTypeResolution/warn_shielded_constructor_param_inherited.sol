// Concrete child inheriting abstract base with shielded constructor param
abstract contract Base {
    suint256 private val;
    constructor(suint256 _val) {
        val = _val;
    }
}

contract Child is Base {
    constructor(suint256 _v) Base(_v) {}
}
// ----
// Warning 5500: (229-240): Shielded types in constructor parameters are visible in deployment transaction data. Contract creation (CREATE/CREATE2) does not encrypt calldata. Consider setting shielded state via a post-deployment transaction instead.
