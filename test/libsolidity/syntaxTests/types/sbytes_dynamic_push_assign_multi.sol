// Tests warning 7239 for multi-push in tuple assignment
// Adapted from array/bytes_push_assign_multi.sol
contract C {
    sbytes x;
    sbytes z;
    function f() public {
        (x.push(), x.push()) = (sbytes1(0), sbytes1(0));
        (((x.push())), (x.push())) = (sbytes1(0), sbytes1(0));
        ((x.push(), x.push()), x.push()) = ((sbytes1(0), sbytes1(0)), sbytes1(0));
        (x.push(), x[0]) = (sbytes1(0), sbytes1(0));
        sbytes storage y = x;
        (x.push(), y.push()) = (sbytes1(0), sbytes1(0));
        // The following is a false positive.
        (x.push(), z.push()) = (sbytes1(0), sbytes1(0));
    }
}
// ----
// Warning 9665: (124-132): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9665: (138-146): Dynamic arrays with shielded element types store their length confidentially, but an upper bound on the length may still be observable through gas cost analysis.
// Warning 9663: (206-216): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (218-228): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (269-279): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (281-291): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (339-349): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (351-361): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (364-374): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (405-415): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (417-427): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (492-502): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (504-514): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (595-605): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 9663: (607-617): FixedBytes Literals converted to shielded fixed bytes will leak during contract deployment.
// Warning 7239: (182-229): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation, one element at a time.
// Warning 7239: (239-292): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation, one element at a time.
// Warning 7239: (302-375): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation, one element at a time.
// Warning 7239: (385-428): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation, one element at a time.
// Warning 7239: (468-515): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation, one element at a time.
// Warning 7239: (571-618): This assignment involves multiple accesses to a bytes array in storage while simultaneously enlarging it. When a bytes array is enlarged, it may transition from short storage layout to long storage layout, which invalidates all references to its elements. It is safer to only enlarge byte arrays in a single operation, one element at a time.
