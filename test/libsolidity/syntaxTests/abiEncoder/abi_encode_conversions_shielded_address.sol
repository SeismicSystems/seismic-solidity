interface testInterface {
    function A(saddress payable) external;
}

contract testContract {
    function main() external view {
        abi.encodeCall(testInterface.A, saddress(0));
    }
}
// ----
// TypeError 5407: (172-183): Cannot implicitly convert component at position 0 from "saddress" to "saddress payable".
