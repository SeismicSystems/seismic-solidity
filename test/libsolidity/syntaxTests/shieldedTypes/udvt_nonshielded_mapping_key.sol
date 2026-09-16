// Non-shielded user defined value types should still be allowed as mapping keys
type MyUint is uint256;
contract C {
    mapping(MyUint => uint256) m;
}
// ----
