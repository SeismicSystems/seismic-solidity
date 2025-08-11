contract C {
    function len() public returns (uint ret) {
        suint[] memory data = new suint[](suint(2));
        data[0] = suint(234);
        data[1] = suint(123);
        delete data;
        assembly {
            ret := mload(data)
        }
    }
}
// ----
// len() -> 0
