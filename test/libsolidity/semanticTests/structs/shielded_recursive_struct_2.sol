// Shielded version of recursive_struct_2.sol
contract C {
    struct S {
        suint16 v;
        S[] x;
    }
    S s;
    constructor() {
         s.v = suint16(21);
         s.x.push(); s.x.push(); s.x.push();
         s.x[0].v = suint16(101); s.x[1].v = suint16(102); s.x[2].v = suint16(103);
    }
    function f() public returns (uint256 a, uint256 b, uint256 c, uint256 d) {
       S storage sptr1 = s.x[0];
       S storage sptr2 = s.x[1];
       S storage sptr3 = s.x[2];
       uint256 slot1; uint256 slot2; uint256 slot3;
       assembly { slot1 := sptr1.slot slot2 := sptr2.slot slot3 := sptr3.slot }
       delete s;
       // v is shielded, so use cload to check it was zeroed
       assembly { a := cload(s.slot) b := cload(slot1) c := cload(slot2) d := cload(slot3) }
    }
}
// ----
// f() -> 0, 0, 0, 0
