pragma abicoder v2;
// Shielded version of struct_referencing.sol
interface I {
    struct S { suint256 a; }
}

library L {
    struct S { suint256 b; suint256 a; }
    function f() public pure returns (uint256, uint256) {
        S memory s;
        s.a = suint256(3);
        return (uint256(s.b), uint256(s.a));
    }
    function g() public pure returns (uint256) {
        I.S memory s;
        s.a = suint256(4);
        return uint256(s.a);
    }
    // argument-dependent lookup tests
    function a(I.S memory) public pure returns (uint256) { return 1; }
    function a(S memory) public pure returns (uint256) { return 2; }
}

contract C is I {
    function f() public pure returns (uint256) {
        S memory s;
        s.a = suint256(1);
        return uint256(s.a);
    }
    function g() public pure returns (uint256) {
        I.S memory s;
        s.a = suint256(2);
        return uint256(s.a);
    }
    function h() public pure returns (uint256, uint256) {
        L.S memory s;
        s.a = suint256(5);
        return (uint256(s.b), uint256(s.a));
    }
    function x() public pure returns (uint256, uint256) {
        return L.f();
    }
    function y() public pure returns (uint256) {
        return L.g();
    }
    function a1() public pure returns (uint256) { S memory s; return L.a(s); }
    function a2() public pure returns (uint256) { L.S memory s; return L.a(s); }
}
// ----
// library: L
// f() -> 1
// g() -> 2
// f() -> 1
// g() -> 2
// h() -> 0, 5
// x() -> 0, 3
// y() -> 4
// a1() -> 1
// a2() -> 2
