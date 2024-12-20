contract C {
    suint120[] data;

    function f() public returns (uint120, uint120, uint120) {
        data.push(suint120(123));
        data.push(suint120(234));
        data.push(suint120(345));
        delete data;
        assembly {
            cstore(data.slot, 3)
        }
        return (uint120(data[suint(0)]), uint120(data[suint(1)]), uint120(data[suint(2)]));
    }
}
// ----
// f() -> 0, 0, 0
// gas irOptimized: 90992
// gas legacy: 111037
// gas legacyOptimized: 109633
