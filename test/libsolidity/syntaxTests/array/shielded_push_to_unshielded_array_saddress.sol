// Cannot push a shielded saddress to a non-shielded address[] array
contract C {
    address[] arr;

    function test() external {
        saddress x = saddress(address(this));
        arr.push(x);
    }
}
// ----
// TypeError 10206: (187-195): Cannot push a shielded type to a non-shielded array
