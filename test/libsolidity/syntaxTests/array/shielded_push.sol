contract c {
    suint256[] data;
    uint256[] transparent_data;

    function test() public {
        transparent_data.push(7);
        data.push(suint(3));
    }
}
