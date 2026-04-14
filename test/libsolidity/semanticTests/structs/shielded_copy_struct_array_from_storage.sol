pragma abicoder v2;

struct S { suint256 value; }

contract Test {
    S[][] a;
    S[] b;

    constructor() {
        a.push();
        a[0].push(S(suint256(1)));
        a[0].push(S(suint256(2)));
        a[0].push(S(suint256(3)));

        b.push(S(suint256(4)));
        b.push(S(suint256(5)));
        b.push(S(suint256(6)));
        b.push(S(suint256(7)));
    }

    function test1() external returns (bool) {
        a.push();
        a[1] = b;

        assert(uint256(a.length) == 2);
        assert(uint256(a[0].length) == 3);
        assert(uint256(a[1].length) == 4);
        assert(uint256(a[1][0].value) == 4);
        assert(uint256(a[1][1].value) == 5);
        assert(uint256(a[1][2].value) == 6);
        assert(uint256(a[1][3].value) == 7);

        return true;
    }

    function test2() external returns (bool) {
        S[][] memory temp = new S[][](2);

        temp = a;

        assert(uint256(temp.length) == 2);
        assert(uint256(temp[0].length) == 3);
        assert(uint256(temp[1].length) == 4);
        assert(uint256(temp[1][0].value) == 4);
        assert(uint256(temp[1][1].value) == 5);
        assert(uint256(temp[1][2].value) == 6);
        assert(uint256(temp[1][3].value) == 7);

        return true;
    }

    function test3() external returns (bool) {
        S[][] memory temp = new S[][](2);

        temp[0] = a[0];
        temp[1] = a[1];

        assert(uint256(temp.length) == 2);
        assert(uint256(temp[0].length) == 3);
        assert(uint256(temp[1].length) == 4);
        assert(uint256(temp[1][0].value) == 4);
        assert(uint256(temp[1][1].value) == 5);
        assert(uint256(temp[1][2].value) == 6);
        assert(uint256(temp[1][3].value) == 7);

        return true;
    }

    function test4() external returns (bool) {
        S[][] memory temp = new S[][](2);

        temp[0] = a[0];
        temp[1] = b;

        assert(uint256(temp.length) == 2);
        assert(uint256(temp[0].length) == 3);
        assert(uint256(temp[1].length) == 4);
        assert(uint256(temp[1][0].value) == 4);
        assert(uint256(temp[1][1].value) == 5);
        assert(uint256(temp[1][2].value) == 6);
        assert(uint256(temp[1][3].value) == 7);

        return true;
    }
}
// ----
// test1() -> true
// test2() -> true
// test3() -> true
// test4() -> true
