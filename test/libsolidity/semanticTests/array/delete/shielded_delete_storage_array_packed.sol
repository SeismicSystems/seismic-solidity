contract C {
    suint120[] data;

    function f() public returns (suint120, suint120, suint120) {
        data.push(123);
        data.push(234);
        data.push(345);
        delete data;
        assembly {
            cstore(data.slot, 3)
        }
        return (data[0], data[1], data[2]);
    }
}
// ----
// f() -> 0, 0, 0
// gas irOptimized: 90992
// gas legacy: 111037
// gas legacyOptimized: 109633
