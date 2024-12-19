contract TestTernary
{
    function g() pure public
    {
        bool t = true;
        bool f = false;
        suint8 v255 = suint8(255);
        suint8 v63 = suint8(63);
        suint8 a;

        // Currently none of these should produce errors or warnings.
        // The result of the operator is always a limited-precision sinteger, even if all arguments are literals.


        a = (suint8(t ? 63 : 255) + suint8(f ? 63 : 255));
        a = (suint8(t ? 0x3f : 0xff) + suint8(f ? 0x3f : 0xff));
        a = (suint8(t ? 63 : 255) + suint8(f ? 63 : 255));
        a = (suint8(t ? v63 : suint8(255)) + suint8(f ? suint8(63) : v255));

        a = (suint8(true ? 63 : 255) + suint8(false ? 63 : 255));
        a = (suint8(true ? 0x3f : 0xff) + suint8(false ? 0x3f : 0xff));
        a = (suint8(true ? 63 : 255) + suint8(false ? 63 : 255));
        a = (suint8(true ? v63 : suint8(255)) + suint8(false ? suint8(63) : v255));

        a = (suint8(t ? 63 : 255) - suint8(f ? 63 : 255));
        a = (suint8(t ? 63 : 255) * suint8(f ? 63 : 255));
        a = (suint8(t ? 63 : 255) / suint8(f ? 63 : 255));

        a = (suint8(t ? suint8(true ? 63 : 255) : suint8(false ? 63 : 255)) +
             suint8(f ? suint8(t ? 63 : 255) : suint8(f ? 63 : 255)));
        a = (suint8(t ? 63 : 255) + suint8(f ? 63 : 255));

    }
}
// ----
// Warning 9660: (113-138): Literals converted to shielded integers will leak during contract deployment.
// Warning 9660: (148-171): Literals converted to shielded integers will leak during contract deployment.
