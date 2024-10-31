# Contribution Guidelines

Please see our contribution guidelines in [the Solidity documentation](https://docs.soliditylang.org/en/latest/contributing.html).

Thank you for your help!

# Seismic Specific Guidelines

When making changes to the compiler or virtual machine code, ensure that these changes are thoroughly validated:

*   **Tests for newly introduced behavior should pass**
*   **The new logic should not introduce regressions**

### Regression Testing

Testing for regressions requires a few extra steps:

1.  **Compiler-Side Testing**:  
    Run the following script on the [Seismic Solidity repository](https://github.com/SeismicSystems/seismic-solidity):
    
    `./scripts/isoltest.sh`
    
    This script will help identify regressions introduced by your changes on the compiler side.
    
3.  **Semantic Testing**:  
    Run semantics tests using the binaries in [Seismic REVM](https://github.com/SeismicSystems/seismic-revm). Navigate to the `revme` directory in the `bins` folder and execute:
    
    `cd /bins/revme cargo run -- semantics`
    
    This will verify the correct behavior of the virtual machine semantics.
    
4.  **Testing Only in Seismic REVM**:  
    If your changes only impact **Seismic REVM**, you can skip the compiler-side testing and run just the semantics test above.
