contract A { constructor(suint) {} }
contract C is A { constructor() A(2) {} }

// ----
