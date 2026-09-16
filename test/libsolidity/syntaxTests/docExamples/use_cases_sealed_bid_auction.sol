// Doc example: Sealed-bid auctions from use-cases.md
contract SealedBidAuction {
    mapping(address => suint256) bids;
    suint256 highestBid;
    saddress highestBidder;
    uint256 public auctionEnd;

    function bid(suint256 amount) public {
        require(block.timestamp < auctionEnd, "Auction ended");
        bids[msg.sender] = amount;

        if (uint256(amount) > uint256(highestBid)) {
            highestBid = amount;
            highestBidder = saddress(msg.sender);
        }
    }

    function getWinner() public view returns (address winner, uint256 amount) {
        require(block.timestamp >= auctionEnd, "Auction still open");
        winner = address(highestBidder);
        amount = uint256(highestBid);
    }
}
// ====
// EVMVersion: =mercury
// ----
// Warning 10313: (669-691): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
// Warning 10313: (710-729): Converting a shielded value to a public type declassifies it; the public value can leak through logs, returndata, or public storage.
