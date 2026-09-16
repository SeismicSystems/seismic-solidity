// Doc example: Private tokens (SRC20) from use-cases.md
contract SRC20 {
    mapping(address => suint256) balanceOf;
    mapping(address => mapping(address => suint256)) allowance;
    suint256 totalSupply;

    function transfer(address to, suint256 amount) public {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
// ====
// EVMVersion: =mercury
// ----
