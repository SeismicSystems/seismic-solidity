contract C {
    sbool x;

    function writeRaw(uint256 raw) public {
        assembly {
            cstore(x.slot, raw)
        }
    }

    function writeTyped(sbool v) public {
        x = v;
    }

    function readRaw() public view returns (uint256 raw) {
        assembly {
            raw := cload(x.slot)
        }
    }

    function readTyped() public view returns (bool) {
        return bool(x);
    }
}
// ----
// readRaw() -> 0
// readTyped() -> false
// writeRaw(uint256): 1 ->
// readRaw() -> 1
// readTyped() -> true
// writeRaw(uint256): 0 ->
// readRaw() -> 0
// readTyped() -> false
// writeRaw(uint256): 2 ->
// readTyped() -> true
// writeTyped(sbool): false ->
// readRaw() -> 0
// writeTyped(sbool): true ->
// readRaw() -> 1
