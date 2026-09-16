contract test {
    sint8 i = sint8(-128);
}
// ----
// Warning 10403: (30-41): Literals converted to shielded integers will leak during contract deployment.
