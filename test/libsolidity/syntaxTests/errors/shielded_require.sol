contract TestSboolRequire {
    function f(sbool condition) public pure {
        require(condition, "Condition failed");
    }
}
