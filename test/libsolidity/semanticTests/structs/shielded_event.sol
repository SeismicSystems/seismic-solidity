pragma abicoder v2;

struct Item { suint256 x; }
library L {
    event Ev(uint256);
    function o() public {
        Item memory item = Item(suint256(1));
        emit L.Ev(uint256(item.x));
    }
}
contract C {
    function f() public {
        L.o();
    }
}
// ----
// library: L
// f() ->
// ~ emit Ev(uint256): 0x01
