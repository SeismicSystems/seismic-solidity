contract c {
    suint256[] data;
    uint256[] transparent_data;

    function test() public {
        transparent_data.push(7);
        data.push(suint(3));
    }
}
// ----
// Warning 9660: (148-156): Literals converted to shielded integers will leak during contract deployment.
