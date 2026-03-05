contract Test {
    suint256[3][] public b;
}
// ----
// TypeError 7091: (20-42): Shielded Types are not supported for public state variables.
// Warning 9665: (20-42): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
