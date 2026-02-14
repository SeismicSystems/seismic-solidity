// SEISMIC NOTE: In Seismic Solidity, SLOAD has side effects (can revert on confidential storage access).
// Therefore function h() which calls sload(0) can no longer be marked as "can be removed".
{
    function a() { sstore(0, 1) }
    function f() { a() }
    function g() { pop(callcode(100, 0x010, 10, 0x00, 32, 0x0100, 32))}
    function h() { pop(sload(0))}
}
// ====
// bytecodeFormat: legacy
// ----
// : movable, movable apart from effects, can be removed, can be removed if no msize
// a: writes storage
// f: writes storage
// g: writes other state, writes storage, writes memory
// h: reads storage
