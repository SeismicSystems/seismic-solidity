// README example: shielded storage
contract ConfidentialWallet {
    suint256 confidentialBalance;

    constructor(suint256 initialBalance) {
        confidentialBalance = initialBalance;
    }

    function addFunds(suint256 amount) public {
        confidentialBalance += amount;
    }

    function spend(suint256 amount) public {
        require(confidentialBalance >= amount, "Insufficient balance");
        confidentialBalance -= amount;
    }
}
// ====
// EVMVersion: =mercury
// ----
