// Comparisons of shielded types should return sbool, not bool
contract C {
    sbool result;

    // Shielded integer comparisons
    function compareInts(sint a, sint b) public {
        result = a < b;
        result = a <= b;
        result = a > b;
        result = a >= b;
        result = a == b;
        result = a != b;
    }

    // Shielded address comparisons
    function compareAddresses(saddress a, saddress b) public {
        result = a == b;
        result = a != b;
    }

    // Shielded fixed bytes comparisons
    function compareBytes(sbytes32 a, sbytes32 b) public {
        result = a == b;
        result = a != b;
        result = a < b;
        result = a <= b;
        result = a > b;
        result = a >= b;
    }

    // Shielded bool comparisons
    function compareBools(sbool a, sbool b) public {
        result = a == b;
        result = a != b;
    }
}
// ====
// EVMVersion: >=cancun
// ----
