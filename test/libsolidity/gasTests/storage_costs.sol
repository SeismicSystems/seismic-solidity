contract C {
    uint x;
    function setX(uint y) public {
        x = y;
    }
    function resetX() public {
        x = 0;
    }
    function readX() public view returns(uint) {
        return x;
    }
}
// ====
// EVMVersion: =current
// optimize: true
// optimize-yul: true
// bytecodeFormat: legacy
// ----
// creation:
//   codeDepositCost: 28000
//   executionCost: 79
//   totalCost: 28079
// external:
//   readX(): 2322
//   resetX(): 5114
//   setX(uint256): 22309
