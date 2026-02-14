contract C {
    suint256 transient a;
    sint256 transient b;
    saddress transient c;
    sbool transient d;
    sbytes32 transient e;
}
// ====
// EVMVersion: >=cancun
// ----
// DeclarationError 9826: (17-37): Shielded types cannot be used with transient storage.
// DeclarationError 9826: (43-62): Shielded types cannot be used with transient storage.
// DeclarationError 9826: (68-88): Shielded types cannot be used with transient storage.
// DeclarationError 9826: (94-111): Shielded types cannot be used with transient storage.
// DeclarationError 9826: (117-137): Shielded types cannot be used with transient storage.
