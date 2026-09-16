contract Large {
    uint public a;
    uint[] public b;
    function f1(uint x) public returns (uint) { a = x; b[uint8(msg.data[0])] = x; }
    function f2(uint x) public returns (uint) { b[uint8(msg.data[1])] = x; }
    function f3(uint x) public returns (uint) { b[uint8(msg.data[2])] = x; }
    function f4(uint x) public returns (uint) { b[uint8(msg.data[3])] = x; }
    function f5(uint x) public returns (uint) { b[uint8(msg.data[4])] = x; }
    function f6(uint x) public returns (uint) { b[uint8(msg.data[5])] = x; }
    function f7(uint x) public returns (uint) { b[uint8(msg.data[6])] = x; }
    function f8(uint x) public returns (uint) { b[uint8(msg.data[7])] = x; }
    function f9(uint x) public returns (uint) { b[uint8(msg.data[8])] = x; }
    function f0(uint x) public pure returns (uint) { require(x > 10); }
    function g1(uint x) public payable returns (uint) { a = x; b[uint8(msg.data[0])] = x; }
    function g2(uint x) public payable returns (uint) { b[uint8(msg.data[1])] = x; }
    function g3(uint x) public payable returns (uint) { b[uint8(msg.data[2])] = x; }
    function g4(uint x) public payable returns (uint) { b[uint8(msg.data[3])] = x; }
    function g5(uint x) public payable returns (uint) { b[uint8(msg.data[4])] = x; }
    function g6(uint x) public payable returns (uint) { b[uint8(msg.data[5])] = x; }
    function g7(uint x) public payable returns (uint) { b[uint8(msg.data[6])] = x; }
    function g8(uint x) public payable returns (uint) { b[uint8(msg.data[7])] = x; }
    function g9(uint x) public payable returns (uint) { b[uint8(msg.data[8])] = x; }
    function g0(uint x) public payable returns (uint) { require(x > 10); }
}
// ====
// EVMVersion: =current
// bytecodeFormat: legacy
// optimize: true
// optimize-runs: 2
// ----
// creation:
//   codeDepositCost: 225800
//   executionCost: 267
//   totalCost: 226067
// external:
//   a(): 2293
//   b(uint256): 4934
//   f0(uint256): 363
//   f1(uint256): 47005
//   f2(uint256): 24970
//   f3(uint256): 25058
//   f4(uint256): 25036
//   f5(uint256): 25014
//   f6(uint256): 24926
//   f7(uint256): 24706
//   f8(uint256): 24838
//   f9(uint256): 24860
//   g0(uint256): 603
//   g1(uint256): 46717
//   g2(uint256): 24704
//   g3(uint256): 24792
//   g4(uint256): 24770
//   g5(uint256): 24858
//   g6(uint256): 24638
//   g7(uint256): 24748
//   g8(uint256): 24726
//   g9(uint256): 24572
