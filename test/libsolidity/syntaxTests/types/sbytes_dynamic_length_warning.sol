contract C {
    // sbytes state variable should warn about length observability
    sbytes data;
}
// ----
// Warning 9665: (85-96): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
