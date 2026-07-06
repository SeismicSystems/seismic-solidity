// Doc example: Compliant finance (Intelligence Contracts) from use-cases.md
// Uses a minimal AccessControl stub instead of the OpenZeppelin import.
abstract contract AccessControl {
    function hasRole(bytes32 role, address account) public view virtual returns (bool);
}

contract ComplianceToken is AccessControl {
    bytes32 public constant COMPLIANCE_ROLE = keccak256("COMPLIANCE_ROLE");

    mapping(address => suint256) balanceOf;

    function hasRole(bytes32 role, address account) public view override returns (bool) {
        return false;
    }

    function getBalance(address account) public view returns (uint256) {
        require(
            msg.sender == account || hasRole(COMPLIANCE_ROLE, msg.sender),
            "Not authorized"
        );
        return uint256(balanceOf[account]);
    }

    function transfer(address to, suint256 amount) public {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
// ====
// EVMVersion: =mercury
// ----
// Warning 5667: (462-474): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (476-491): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 2018: (445-558): Function state mutability can be restricted to pure
