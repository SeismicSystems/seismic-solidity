contract test {
    function fun() public pure {
        suint256 x;
        while (true) { x = suint(1); break; continue; } x = suint(9);
    }
}
// ----
// Warning 9660: (96-104): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (129-137): Literals converted to shielded integers will leak during contract deployment.
// Warning 5740: (113-121): Unreachable code.
