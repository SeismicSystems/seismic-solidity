contract test {
    constructor() payable {}

    function getBalance() public returns (uint256 balance) {
        return saddress(this).balance;
    }
}
// ----
// constructor(), 23 wei ->
// getBalance() -> 23
