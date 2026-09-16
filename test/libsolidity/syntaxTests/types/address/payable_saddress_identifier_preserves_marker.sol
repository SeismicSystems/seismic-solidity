contract C {
    saddress private s;
    function leak() external view returns (address payable) {
        address payable p = payable(s);
        return p;
    }
}
// ----
// TypeError 9574: (107-137): Type saddress payable is not implicitly convertible to expected type address payable.
