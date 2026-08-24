contract C {
    sbool x;
    function getStorageDefault() public view returns (bool) {
        return bool(x);
    }
    function getLocalDefault() public pure returns (bool) {
        sbool local;
        return bool(local);
    }
}
// ----
// getStorageDefault() -> false
// getLocalDefault() -> false
