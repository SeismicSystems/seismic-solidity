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
// ParserError 7637: (31-39): Experimental solidity requires Constantinople EVM version at the minimum.
