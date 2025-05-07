contract C {
	suint256 s;
	constructor(suint256 s) {
	    s = s;
    }
}
// ====
// bytecodeFormat: >=EOFv1
// ----
// constructor(): 1 -> FAILURE
