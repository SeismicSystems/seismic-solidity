object "a" {
    code {
        pop(cload(0))
    }
}

// ====
// bytecodeFormat: >=EOFv1
// ----
// TypeError 10110: (20-25): The "cload" instruction is only available in Seismic legacy bytecode VM (you are currently compiling to EOF).
// TypeError 3950: (20-28): Expected expression to evaluate to one value, but got 0 values instead.
