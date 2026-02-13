contract C {
    sbytes data;

    function testDelete() internal {
        delete data;
    }
}
// ----
