contract TestImplicitCast {
    function cast() internal view returns (saddress) {
        return saddress(msg.sender);
    }
}

