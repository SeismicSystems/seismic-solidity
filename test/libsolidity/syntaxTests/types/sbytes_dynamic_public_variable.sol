contract C {
    sbytes public data;
}
// ----
// TypeError 10101: (17-35): Shielded Types are not supported for public state variables.
// Warning 10305: (17-35): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
