contract C {
    function f() public pure returns (saddress r) {
        bytes21 x = 0x1122334455667788990011223344556677889900ff;
        bytes20 y;
        assembly {
            y := x
        }
        saddress z = saddress(y);
        assembly {
            r := z
        }
        require(z == payable(saddress(0x1122334455667788990011223344556677889900)));
    }

    function g() public pure returns (saddress payable r) {
        bytes21 x = 0x1122334455667788990011223344556677889900ff;
        bytes20 y;
        assembly {
            y := x
        }
        saddress payable z = payable(saddress(y));
        assembly {
            r := z
        }
        require(z == payable(saddress(0x1122334455667788990011223344556677889900)));
    }
}
// ----
// f() -> 0x1122334455667788990011223344556677889900
// g() -> 0x1122334455667788990011223344556677889900

