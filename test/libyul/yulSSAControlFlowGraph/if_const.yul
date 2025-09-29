{
    let x := calldataload(3)
    // this should not appear in the output at all
    if 0 {
        x := calldataload(77)
    }
    // this should avoid a conditional jump
    if 33 {
        x := calldataload(42)
    }
    let y := calldataload(x)
    sstore(y, 0)
}
// ----
// digraph SSACFG {
// nodesep=0.7;
// graph[fontname="DejaVu Sans"]
// node[shape=box,fontname="DejaVu Sans"];
//
// Entry0 [label="Entry"];
// Entry0 -> Block0_0;
// Block0_0 [label="\
// Block 0; (0, max 0)\nLiveIn: \l\
// LiveOut: \l\nv1 := calldataload(3)\l\
// v3 := calldataload(42)\l\
// v4 := calldataload(v3)\l\
// sstore(0, v4)\l\
// "];
// Block0_0Exit [label="MainExit"];
// Block0_0 -> Block0_0Exit;
// }
