// External call through interface-typed state var — context B warning (10402)
interface IVault {
    function deposit(suint256 amount) external;
}

contract User {
    IVault vault;
    function test() external {
        vault.deposit(suint256(1000));
    }
}
// ----
// Warning 10402: (237-251): Literals converted to shielded integers will leak during contract deployment.
