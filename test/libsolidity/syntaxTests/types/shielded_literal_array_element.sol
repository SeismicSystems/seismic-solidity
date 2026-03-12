contract C {
    suint256[] private arr;
    suint8[3] private fixed_arr;

    function test() internal {
        // Push shielded literal to dynamic array
        arr.push(42s);
        arr.push(0s);
        // Assign to fixed array element
        fixed_arr[0] = 1s;
        fixed_arr[1] = 2s;
        fixed_arr[2] = 255s;
    }
}
// ----
// Warning 10305: (17-39): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9667: (173-176): Shielded number literals will leak during contract deployment.
// Warning 9667: (196-198): Shielded number literals will leak during contract deployment.
// Warning 9667: (265-267): Shielded number literals will leak during contract deployment.
// Warning 9667: (292-294): Shielded number literals will leak during contract deployment.
// Warning 9667: (319-323): Shielded number literals will leak during contract deployment.
