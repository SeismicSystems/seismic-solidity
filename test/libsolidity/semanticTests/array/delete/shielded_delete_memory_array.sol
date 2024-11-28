contract C {
    function len() public returns (uint ret) {
        suint[] memory data = new suint[](2);
        data[0] = 234;
        data[1] = 123;
        delete data;
        assembly {
            ret := mload(data)
        }
    }
}
// ----
// len() -> 0
