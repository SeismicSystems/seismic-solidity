contract C {
    sbytes constant data = "";
}
// ----
// Warning 9665: (17-42): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
