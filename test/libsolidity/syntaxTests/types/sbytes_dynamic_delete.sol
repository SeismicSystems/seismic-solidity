contract C {
    sbytes data;

    function testDelete() internal {
        delete data;
    }
}
// ----
// Warning 10305: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
