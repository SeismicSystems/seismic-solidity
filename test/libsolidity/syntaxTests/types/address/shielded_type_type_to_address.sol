struct S {
    uint x;
}

enum E {A, B, C}

contract C {
    function f() public pure {
        saddress(uint);
        saddress(bytes16);
        saddress(bool);
        saddress(saddress);
        saddress(fixed);

        saddress(S);
        saddress(E);

        saddress(uint[]);
        saddress(uint[][]);
        saddress(uint[5]);
        saddress(string);
        saddress(bytes);
        saddress(S[]);
        saddress(E[]);
        saddress((uint, uint));

        saddress(type(uint));
    }
}
// ----
// TypeError 9640: (96-110): Explicit type conversion not allowed from "type(uint256)" to "saddress".
// TypeError 9640: (120-137): Explicit type conversion not allowed from "type(bytes16)" to "saddress".
// TypeError 9640: (147-161): Explicit type conversion not allowed from "type(bool)" to "saddress".
// TypeError 9640: (171-189): Explicit type conversion not allowed from "type(saddress)" to "saddress".
// TypeError 9640: (199-214): Explicit type conversion not allowed from "type(fixed128x18)" to "saddress".
// TypeError 9640: (225-236): Explicit type conversion not allowed from "type(struct S storage pointer)" to "saddress".
// TypeError 9640: (246-257): Explicit type conversion not allowed from "type(enum E)" to "saddress".
// TypeError 9640: (268-284): Explicit type conversion not allowed from "type(uint256[] memory)" to "saddress".
// TypeError 9640: (294-312): Explicit type conversion not allowed from "type(uint256[] memory[] memory)" to "saddress".
// TypeError 9640: (322-339): Explicit type conversion not allowed from "type(uint256[5] memory)" to "saddress".
// TypeError 9640: (349-365): Explicit type conversion not allowed from "type(string storage pointer)" to "saddress".
// TypeError 9640: (375-390): Explicit type conversion not allowed from "type(bytes storage pointer)" to "saddress".
// TypeError 9640: (400-413): Explicit type conversion not allowed from "type(struct S memory[] memory)" to "saddress".
// TypeError 9640: (423-436): Explicit type conversion not allowed from "type(enum E[] memory)" to "saddress".
// TypeError 9640: (446-468): Explicit type conversion not allowed from "tuple(type(uint256),type(uint256))" to "saddress".
// TypeError 9640: (479-499): Explicit type conversion not allowed from "type(uint256)" to "saddress".
