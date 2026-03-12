contract Test {
    sbytes4[3][] public a;
    sbytes32[3][] public b;
}
// ----
// TypeError 7091: (20-41): Shielded Types are not supported for public state variables.
// Warning 9665: (20-41): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// TypeError 7091: (47-69): Shielded Types are not supported for public state variables.
// Warning 9665: (47-69): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
