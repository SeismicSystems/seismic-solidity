library L {
    function xor(sbool a, sbool b) internal pure returns (sbool) {
        return a != b;
    }
}

contract C {
    using L for sbool;

    function foo(sbool a, sbool b) public returns (bool) {
        return bool(a.xor(b));
    }
}
// ----
// foo(sbool,sbool): true, true -> false
// foo(sbool,sbool): true, false -> true
// foo(sbool,sbool): false, true -> true
// foo(sbool,sbool): false, false -> false
