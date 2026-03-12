contract Test {
    struct MyStructSbytes4 {
        sbytes4[3][] b;
    }
    MyStructSbytes4 public failSbytes4;
    struct MyStructSbytes32 {
        sbytes32[3][] b;
    }
    MyStructSbytes32 public failSbytes32;
}
// ----
// TypeError 7091: (79-113): Shielded Types are not supported for public state variables.
// TypeError 5359: (79-113): The struct has all its members omitted, therefore the getter cannot return any values.
// TypeError 7091: (180-216): Shielded Types are not supported for public state variables.
// TypeError 5359: (180-216): The struct has all its members omitted, therefore the getter cannot return any values.
