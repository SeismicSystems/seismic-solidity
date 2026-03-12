// Bug: 40-hex-digit shielded literal should NOT trigger address-related warnings
contract C {
    suint256 private x;

    function test() internal {
        // 40 hex digits (same length as address) with s suffix
        x = 0x1234567890123456789012345678901234567890s;
    }
}
// ----
// Warning 10416: (227-270): Shielded number literals will leak during contract deployment.
// TypeError 7407: (227-270): Type address is not implicitly convertible to expected type suint256.
