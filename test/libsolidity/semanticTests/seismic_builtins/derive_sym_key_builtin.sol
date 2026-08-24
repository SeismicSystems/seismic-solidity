// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ECDHBuiltin {
    // Verify the built-in matches the raw staticcall approach
    function testMatchesRawPrecompile() public view returns (bool) {
        sbytes32 sk = sbytes32(hex"7e38022030c40773cc561c1cc9c0053e48b0be2cee33c13495f096942ea176ef");
        bytes memory pk = hex"02555d7b94d8afc4afdf5a03e9da73a408b6d19c865036bae833864d2353e85a25";

        bytes32 builtinResult = ecdh(sk, pk);

        // Raw staticcall
        (bool success, bytes memory output) = address(0x65).staticcall(abi.encodePacked(bytes32(sk), pk));
        require(success);
        bytes32 rawResult;
        assembly { rawResult := mload(add(output, 32)) }

        return builtinResult == rawResult;
    }

    // Verify ECDH shared secret: sk1*pk2 == sk2*pk1
    function testECDHSymmetry() public view returns (bool) {
        sbytes32 sk1 = sbytes32(hex"7e38022030c40773cc561c1cc9c0053e48b0be2cee33c13495f096942ea176ef");
        bytes memory pk1 = hex"03f176e697b5b0c4799f1816f5fe114263d1c01a84ad296129f994278499f0842e";
        sbytes32 sk2 = sbytes32(hex"adbed354135e517bc881d55fa60c455737d1ba98d446c0866cec3837e13d9906");
        bytes memory pk2 = hex"02555d7b94d8afc4afdf5a03e9da73a408b6d19c865036bae833864d2353e85a25";

        bytes32 resultA = ecdh(sk1, pk2);
        bytes32 resultB = ecdh(sk2, pk1);
        return resultA == resultB;
    }
}
// ====
// EVMVersion: >=mercury
// ====
// ----
// testMatchesRawPrecompile() -> true
// testECDHSymmetry() -> true
