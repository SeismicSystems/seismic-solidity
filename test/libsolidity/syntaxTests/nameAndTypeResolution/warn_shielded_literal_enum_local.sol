// Enum conversion to shielded integer locally — SHOULD warn
contract C {
    enum Color { Red, Green, Blue }
    suint8 private val;

    function test() external {
        val = suint8(Color.Green);
    }
}
// ----
// Warning 1457: (182-201): Enums converted to shielded integers will leak during contract deployment.
