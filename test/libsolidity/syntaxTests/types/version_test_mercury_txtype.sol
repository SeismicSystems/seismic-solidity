contract C {
    function f() public view returns (uint256 t) {
        assembly {
            t := txtype()
        }
    }
}

// ====
// EVMVersion: <mercury
// ----
// TypeError 10002: (100-106): The "txtype" instruction is only available for Mercury-compatible VMs (you are currently compiling for "cancun").
// DeclarationError 8678: (95-108): Variable count for assignment to "t" does not match number of values (1 vs. 0)
