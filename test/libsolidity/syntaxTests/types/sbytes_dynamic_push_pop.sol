contract C {
    sbytes data;

    function testPush() internal {
        data.push(sbytes1(0x42));
        data.push(sbytes1(0xFF));
    }

    function testPushEmpty() internal {
        data.push();
    }

    function testPop() internal {
        data.pop();
    }
}
// ----
// Warning 10305: (17-28): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9663: (84-97): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (118-131): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
