contract test {
    sint8 j = sint8(127);
}
// ----
// Warning 9660: (30-40): Literals converted to shielded integers will leak during contract deployment.
