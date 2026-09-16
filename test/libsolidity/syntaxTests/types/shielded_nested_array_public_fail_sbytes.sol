contract Test {
    sbytes4[3][] public a;
    sbytes32[3][] public b;
}
// ----
// TypeError 10101: (20-41): Shielded Types are not supported for public state variables.
// Warning 10305: (20-41): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 10101: (47-69): Shielded Types are not supported for public state variables.
// Warning 10305: (47-69): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
