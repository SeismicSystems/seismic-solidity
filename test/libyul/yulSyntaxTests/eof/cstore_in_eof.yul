object "a" {
    code {
        cstore(0, 42)
    }
}

// ====
// bytecodeFormat: >=EOFv1
// ----
// TypeError 10110: (20-26): The "cstore" instruction is only available in Seismic legacy bytecode VM (you are currently compiling to EOF).
