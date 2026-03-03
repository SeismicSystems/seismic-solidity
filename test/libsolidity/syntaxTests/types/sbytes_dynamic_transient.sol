contract C {
    sbytes transient data;
}
// ====
// EVMVersion: >=cancun
// ----
// DeclarationError 9826: (17-38): Shielded types cannot be used with transient storage.
// UnimplementedFeatureError 1834: Transient data location is only supported for value types.
