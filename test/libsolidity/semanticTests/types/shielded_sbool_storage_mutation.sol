contract C {
    sbool value;
    mapping(uint256 => sbool) values;

    function setValue(sbool v) public {
        value = v;
    }

    function getValue() public view returns (bool) {
        return bool(value);
    }

    function clearValue() public {
        delete value;
    }

    function setAt(uint256 k, sbool v) public {
        values[k] = v;
    }

    function getAt(uint256 k) public view returns (bool) {
        return bool(values[k]);
    }

    function clearAt(uint256 k) public {
        delete values[k];
    }
}
// ----
// getValue() -> false
// setValue(sbool): true ->
// getValue() -> true
// setValue(sbool): false ->
// getValue() -> false
// clearValue() ->
// getValue() -> false
// getAt(uint256): 7 -> false
// setAt(uint256,sbool): 7, true ->
// getAt(uint256): 7 -> true
// setAt(uint256,sbool): 7, false ->
// getAt(uint256): 7 -> false
// clearAt(uint256): 7 ->
// getAt(uint256): 7 -> false
