contract C {
    sbytes[] private messages;

    function setup() external {
        messages.push();
        messages.push();
    }

    function deleteFirst() external {
        delete messages[0];
    }
}
// ====
// compileViaYul: true
// ----
// setup() ->
// deleteFirst() ->
