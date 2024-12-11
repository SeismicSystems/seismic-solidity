contract C {
    suint256 to_store;
    function f(suint256 x) public {
        assembly {
            cstore(to_store.slot, x)
        }
    }
}

// ====
// EVMVersion: <mercury
// ----
// TypeError 6245: (103-109): The "cstore" instruction is only available for Mercury-compatible VMs (you are currently compiling for "cancun").
