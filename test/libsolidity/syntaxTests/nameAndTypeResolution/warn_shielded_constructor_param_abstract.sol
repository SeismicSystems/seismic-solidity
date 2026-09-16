// Abstract contract constructor — no warning (not externally visible)
abstract contract Base {
    suint256 private val;
    constructor(suint256 _val) {
        val = _val;
    }
}
// ----
