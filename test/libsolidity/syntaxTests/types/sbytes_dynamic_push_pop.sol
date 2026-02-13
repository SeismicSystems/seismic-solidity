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
// Warning 9663: (84-97): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (118-131): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
