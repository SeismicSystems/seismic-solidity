contract TestForSbool {
    function f(sbool condition, suint counter, suint limit) public pure returns (uint) {
        for (; condition; ) {
            counter++;
            if (counter == limit) {
                break;
            }
        }
        return uint(counter);
    }
}

