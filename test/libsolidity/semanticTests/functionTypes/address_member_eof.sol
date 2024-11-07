contract C {
    function f() public view returns (address a1, address a2) {
        a1 = this.f.address;
        this.f.address;
        [this.f.address][0];
        a2 = [this.f.address][0];
    }
}
// ====
// compileToEOF: true
// EVMVersion: >=prague
// ----
// f() -> 0x0c06afe3a8444fc0004668591e8306bfb9968e79e,0x0c06afe3a8444fc0004668591e8306bfb9968e79e
