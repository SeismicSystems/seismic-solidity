contract C {
    event Ev(bool);
    sbool perm;
    function set() public returns(uint) {
        sbool tmp;
        assembly {
            tmp := 5
        }
        perm = tmp;
        return 1;
    }

    function getPerm() public view returns(bool) {
        return bool(perm);
    }

    function ret() public view returns(bool) {
        sbool tmp;
        assembly {
            tmp := 5
        }
        return tmp;
    }
    function ev() public returns(uint) {
        sbool tmp;
        assembly {
            tmp := 5
        }
        emit Ev(tmp);
        return 1;
    }
}
// ----
// set() -> 1
// getPerm() -> true
// ret() -> true
// ev() -> 1
// ~ emit Ev(bool): true

