contract C {
    sbool a;
    sbool b;
    sbool c;

    function setAll(sbool _a, sbool _b, sbool _c) public {
        a = _a;
        b = _b;
        c = _c;
    }

    function flipB() public {
        b = !b;
    }

    function getAll() public view returns (bool, bool, bool) {
        return (bool(a), bool(b), bool(c));
    }
}
// ----
// getAll() -> false, false, false
// setAll(sbool,sbool,sbool): true, false, true ->
// getAll() -> true, false, true
// flipB() ->
// getAll() -> true, true, true
// setAll(sbool,sbool,sbool): false, true, false ->
// getAll() -> false, true, false
