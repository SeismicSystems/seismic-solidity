contract C {
    function leftU(suint8 x, suint8 y) public returns (uint8) {
        return uint8(x << y);
    }
}
// ----
// leftU(suint8,suint8): 255, 8 -> 0
// leftU(suint8,suint8): 255, 1 -> 254
// leftU(suint8,suint8): 255, 0 -> 255
