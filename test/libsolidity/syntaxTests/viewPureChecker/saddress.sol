contract C {
    function f() public view returns (uint) {
        return saddress(this).balance;
    }
    function g() public view returns (uint) {
        return saddress(0).balance;
    }
    function h() public view returns (bytes32) {
        return saddress(0).codehash;
    }

    function builtins() public {
        payable(saddress(this)).transfer(1);
        require(payable(saddress(this)).send(2));
        (bool success,) = saddress(this).delegatecall("");
        require(success);
		(success,) = saddress(this).call("");
        require(success);
    }
}
// ----
