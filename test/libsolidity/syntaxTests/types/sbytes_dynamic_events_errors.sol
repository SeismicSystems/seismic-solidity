contract C {
    event DataEvent(sbytes data);

    error DataError(sbytes data);

    function test() internal {
        sbytes memory m = new sbytes(1);
        emit DataEvent(m);
    }
}
// ----
// TypeError 4626: (33-44): Shielded Types are not allowed as event parameter type.
