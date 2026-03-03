contract C {
    function f() public view returns (uint) {
        return block.timestamp_ms;
    }
    function g() public view returns (uint ret) {
        assembly {
            ret := timestampms()
        }
    }
}
// ====
// EVMVersion: =cancun
// ----
// TypeError 4521: (74-92): "timestamp_ms" is not supported by the VM version.
// TypeError 6245: (188-199): The "timestampms" instruction is only available for Mercury-compatible VMs (you are currently compiling for "cancun").
// DeclarationError 8678: (181-201): Variable count for assignment to "ret" does not match number of values (1 vs. 0)
