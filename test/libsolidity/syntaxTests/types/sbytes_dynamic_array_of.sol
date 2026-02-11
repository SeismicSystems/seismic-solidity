contract C {
    sbytes[] private collection;

    function addEntry() internal {
        collection.push();
        collection[0].push(sbytes1(0x01));
    }
}
// ----
// Warning 9665: (17-44): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
