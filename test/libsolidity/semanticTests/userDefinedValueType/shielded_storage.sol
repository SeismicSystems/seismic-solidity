// Test user-defined types wrapping shielded primitives correctly use cload/cstore
type MyShieldedUint is suint256;
type MyShieldedBool is sbool;
type MyShieldedAddress is saddress;
type MyShieldedBytes32 is sbytes32;

contract C {
    MyShieldedUint internal storedUint;
    MyShieldedBool internal storedBool;
    MyShieldedAddress internal storedAddress;
    MyShieldedBytes32 internal storedBytes;

    function setUint(uint256 x) external {
        storedUint = MyShieldedUint.wrap(suint256(x));
    }

    function getUint() external view returns (uint256) {
        return uint256(MyShieldedUint.unwrap(storedUint));
    }

    function setBool(bool x) external {
        storedBool = MyShieldedBool.wrap(sbool(x));
    }

    function getBool() external view returns (bool) {
        return bool(MyShieldedBool.unwrap(storedBool));
    }

    function setAddress(address x) external {
        storedAddress = MyShieldedAddress.wrap(saddress(x));
    }

    function getAddress() external view returns (address) {
        return address(MyShieldedAddress.unwrap(storedAddress));
    }

    function setBytes(bytes32 x) external {
        storedBytes = MyShieldedBytes32.wrap(sbytes32(x));
    }

    function getBytes() external view returns (bytes32) {
        return bytes32(MyShieldedBytes32.unwrap(storedBytes));
    }
}
// ----
// setUint(uint256): 42 ->
// getUint() -> 42
// setBool(bool): true ->
// getBool() -> true
// setAddress(address): 0x1234567890123456789012345678901234567890 ->
// getAddress() -> 0x1234567890123456789012345678901234567890
// setBytes(bytes32): 0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef ->
// getBytes() -> 0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
