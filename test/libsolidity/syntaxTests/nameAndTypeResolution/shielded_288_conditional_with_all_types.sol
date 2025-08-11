contract C {
    struct s1 {
        suint x;
    }
    s1 struct_x;
    s1 struct_y;

    function fun_x() public {}
    function fun_y() public {}

    enum small { A, B, C, D }

    mapping(suint8 => suint8) table1;
    mapping(suint8 => suint8) table2;

    function f() public {
        // sintegers
        suint x;
        suint y;
        suint g = true ? x : y;
        g += suint(1); // Avoid unused var warning

        // sinteger constants
        suint h = true ? suint(1) : suint(3);
        h += suint(1); // Avoid unused var warning

        // string literal
        string memory i = true ? "hello" : "world";
        i = "used"; //Avoid unused var warning
    }
    function f2() public {
        // bool
        sbool j = true ? sbool(true) : sbool(false);
        j = j && sbool(true); // Avoid unused var warning

        // real is not there yet.

        // array
        bytes1[2] memory a;
        bytes1[2] memory b;
        bytes1[2] memory k = true ? a : b;
        k[0] = bytes1(0); //Avoid unused var warning

        bytes memory e;
        bytes memory f;
        bytes memory l = true ? e : f;
        l[0] = bytes1(0); // Avoid unused var warning

        // fixed bytes
        bytes2 c;
        bytes2 d;
        bytes2 m = true ? c : d;
        m &= m;

    }
    function f3() public {
        // contract doesn't fit in here

        // struct
        struct_x = true ? struct_x : struct_y;

        // function
        function () r = true ? fun_x : fun_y;
        r(); // Avoid unused var warning
        // enum
        small enum_x;
        small enum_y;
        enum_x = true ? enum_x : enum_y;

        // tuple
        (suint n, suint o) = true ? (suint(1), suint(2)) : (suint(3), suint(4));
        (n, o) = (o, n); // Avoid unused var warning
        // mapping
        mapping(suint8 => suint8) storage p = true ? table1 : table2;
        p[suint8(0)] = suint8(0); // Avoid unused var warning
        // typetype
        suint32 q = true ? suint32(1) : suint32(2);
        q += suint32(1); // Avoid unused var warning
        // modifier doesn't fit in here

        // magic doesn't fit in here

        // module doesn't fit in here
    }
}
// ----
// Warning 2519: (1074-1088): This declaration shadows an existing declaration.
// TypeError 7804: (193-199): Shielded types are not allowed as mapping keys.
