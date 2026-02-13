contract C {
    sbytes[] private collection;

    function addEntry() internal {
        collection.push();
        collection[0].push(sbytes1(0x01));
    }
}
// ----
// Warning 9663: (136-149): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
