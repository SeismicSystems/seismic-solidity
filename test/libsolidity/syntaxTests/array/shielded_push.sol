contract c {
    suint256[] data;
    uint256[] transparent_data;

    function test() public {
        transparent_data.push(7);
        data.push(suint(3));
    }
}
// ----
// Warning 9665: (17-32): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
