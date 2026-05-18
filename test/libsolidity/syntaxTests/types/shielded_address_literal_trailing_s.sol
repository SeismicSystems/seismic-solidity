contract C {
    address private a = 0x1234567890AbcdEF1234567890aBcdef12345678s;
    saddress private b = 0x1234567890AbcdEF1234567890aBcdef12345678s;
}
// ----
// Warning 10416: (37-80): Shielded number literals will leak during contract deployment.
// Warning 10416: (107-150): Shielded number literals will leak during contract deployment.
// TypeError 7407: (37-80): Type saddress is not implicitly convertible to expected type address.
