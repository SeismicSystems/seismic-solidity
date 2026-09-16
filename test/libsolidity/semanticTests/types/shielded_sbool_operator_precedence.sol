contract C {
    function andBeforeOr(sbool a, sbool b, sbool c) public pure returns (bool) {
        return bool(a || b && c);
    }

    function withParens(sbool a, sbool b, sbool c) public pure returns (bool) {
        return bool((a || b) && c);
    }

    function notBeforeAnd(sbool a, sbool b) public pure returns (bool) {
        return bool(!a && b);
    }
}
// ----
// andBeforeOr(sbool,sbool,sbool): true, false, false -> true
// withParens(sbool,sbool,sbool): true, false, false -> false
// andBeforeOr(sbool,sbool,sbool): false, true, false -> false
// withParens(sbool,sbool,sbool): false, true, false -> false
// andBeforeOr(sbool,sbool,sbool): false, true, true -> true
// withParens(sbool,sbool,sbool): false, true, true -> true
// notBeforeAnd(sbool,sbool): true, true -> false
// notBeforeAnd(sbool,sbool): false, true -> true
// notBeforeAnd(sbool,sbool): false, false -> false
