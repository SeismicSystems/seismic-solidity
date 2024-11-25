contract C {
    suint120[] data;

    function f() public returns (uint120, uint120, uint120) {
        data.push(123);
        data.push(234);
        data.push(345);
        delete data;
        assembly {
            cstore(data.slot, 3)
        }
        return (uint120(data[0]), uint120(data[1]), uint120(data[2]));
    }
}
// ----
// f() -> 0, 0, 0
// gas irOptimized: 90992
// gas legacy: 111037
// gas legacyOptimized: 109633
