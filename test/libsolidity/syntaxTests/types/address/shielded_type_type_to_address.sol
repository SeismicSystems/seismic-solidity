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
// TypeError 9640: (96-109): Explicit type conversion not allowed from "type(uint256)" to "saddress".
// TypeError 9640: (119-135): Explicit type conversion not allowed from "type(bytes16)" to "saddress".
// TypeError 9640: (145-158): Explicit type conversion not allowed from "type(bool)" to "saddress".
// TypeError 9640: (168-184): Explicit type conversion not allowed from "type(saddress)" to "saddress".
// TypeError 9640: (194-208): Explicit type conversion not allowed from "type(fixed128x18)" to "saddress".
// TypeError 9640: (219-229): Explicit type conversion not allowed from "type(struct S storage pointer)" to "saddress".
// TypeError 9640: (239-249): Explicit type conversion not allowed from "type(enum E)" to "saddress".
// TypeError 9640: (260-275): Explicit type conversion not allowed from "type(uint256[] memory)" to "saddress".
// TypeError 9640: (285-302): Explicit type conversion not allowed from "type(uint256[] memory[] memory)" to "saddress".
// TypeError 9640: (312-328): Explicit type conversion not allowed from "type(uint256[5] memory)" to "saddress".
// TypeError 9640: (338-353): Explicit type conversion not allowed from "type(string storage pointer)" to "saddress".
// TypeError 9640: (363-377): Explicit type conversion not allowed from "type(bytes storage pointer)" to "saddress".
// TypeError 9640: (387-399): Explicit type conversion not allowed from "type(struct S memory[] memory)" to "saddress".
// TypeError 9640: (409-421): Explicit type conversion not allowed from "type(enum E[] memory)" to "saddress".
// TypeError 9640: (431-452): Explicit type conversion not allowed from "tuple(type(uint256),type(uint256))" to "saddress".
// TypeError 9640: (463-482): Explicit type conversion not allowed from "type(uint256)" to "saddress".
