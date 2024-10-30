contract test {
    mapping(suint8 => suint8) table;
    function get(suint8 k) public returns (suint8 v) {
        return table[k];
    }
    function set(suint8 k, suint8 v) public {
        table[k] = v;
    }
}
// ----
// get(suint8): 0 -> 0
// get(suint8): 0x01 -> 0
// get(suint8): 0xa7 -> 0
// set(suint8,suint8): 0x01, 0xa1 ->
// get(suint8): 0 -> 0
// get(suint8): 0x01 -> 0xa1
// get(suint8): 0xa7 -> 0
// set(suint8,suint8): 0x00, 0xef ->
// get(suint8): 0 -> 0xef
// get(suint8): 0x01 -> 0xa1
// get(suint8): 0xa7 -> 0
// set(suint8,suint8): 0x01, 0x05 ->
// get(suint8): 0 -> 0xef
// get(suint8): 0x01 -> 0x05
// get(suint8): 0xa7 -> 0

