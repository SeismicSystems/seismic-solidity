interface testInterface {
    function A(saddress payable) external;
}

contract testContract {
    function main() external view {
        abi.encodeCall(testInterface.A, saddress(0));
    }
}
// ----
// TypeError 9664: (155-170): Cannot use abi.encodeCall with functions that have shielded parameter types. Encoding shielded values would leak information through the resulting bytes.
