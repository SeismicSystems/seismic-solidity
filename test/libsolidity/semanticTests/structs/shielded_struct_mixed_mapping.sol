// Structs with mixed fields inside mappings, copy between mapping entries
contract C {
    struct Record {
        uint256 index;
        suint256 balance;
        sbool active;
        uint16 category;
    }

    mapping(uint256 => Record) records;

    function create(uint256 key, uint256 bal, uint16 cat) public {
        records[key] = Record({
            index: key,
            balance: suint256(bal),
            active: sbool(true),
            category: cat
        });
    }

    function get(uint256 key) public returns (
        uint256 index, uint256 balance, bool active, uint16 category
    ) {
        Record storage r = records[key];
        index = r.index;
        balance = uint256(r.balance);
        active = bool(r.active);
        category = r.category;
    }

    function copyRecord(uint256 from, uint256 to) public {
        records[to] = records[from];
    }

    function deactivate(uint256 key) public {
        records[key].active = sbool(false);
        records[key].balance = suint256(0);
    }

    function deleteRecord(uint256 key) public {
        delete records[key];
    }
}
// ----
// create(uint256,uint256,uint16): 1, 1000, 5 ->
// get(uint256): 1 -> 1, 1000, true, 5
// create(uint256,uint256,uint16): 2, 2000, 10 ->
// get(uint256): 2 -> 2, 2000, true, 10
// copyRecord(uint256,uint256): 1, 3 ->
// get(uint256): 3 -> 1, 1000, true, 5
// deactivate(uint256): 1 ->
// get(uint256): 1 -> 1, 0, false, 5
// get(uint256): 3 -> 1, 1000, true, 5
// deleteRecord(uint256): 2 ->
// get(uint256): 2 -> 0, 0, false, 0
