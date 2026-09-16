contract A { constructor(suint) {} }
contract C is A { constructor() A(suint(2)) {} }

// ----
