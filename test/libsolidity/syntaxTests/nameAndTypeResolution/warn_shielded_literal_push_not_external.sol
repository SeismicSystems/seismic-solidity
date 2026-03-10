// arr.push() is a built-in, NOT an external call — SHOULD warn
contract C {
    suint256[] private arr;
    function test() external {
        arr.push(suint256(42));
    }
}
// ----
// Warning 9665: (83-105): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9660: (155-167): Literals converted to shielded integers will leak during contract deployment.
