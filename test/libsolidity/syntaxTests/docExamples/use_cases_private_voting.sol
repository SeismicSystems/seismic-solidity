// Doc example: Private voting from use-cases.md
contract PrivateVoting {
    mapping(address => sbool) hasVoted;
    suint256 yesVotes;
    suint256 noVotes;
    uint256 public votingEnd;

    function vote(sbool inFavor) public {
        require(block.timestamp < votingEnd, "Voting ended");
        require(!bool(hasVoted[msg.sender]), "Already voted");

        hasVoted[msg.sender] = sbool(true);
        if (bool(inFavor)) {
            yesVotes += suint256(1);
        } else {
            noVotes += suint256(1);
        }
    }

    function getResults() public view returns (uint256 yes, uint256 no) {
        require(block.timestamp >= votingEnd, "Voting still open");
        yes = uint256(yesVotes);
        no = uint256(noVotes);
    }
}
// ====
// EVMVersion: >=mercury
// ----
// Warning 10406: (389-400): Bool Literals converted to shielded bools will leak during contract deployment.
// Warning 10403: (455-466): Literals converted to shielded integers will leak during contract deployment.
// Warning 10403: (508-519): Literals converted to shielded integers will leak during contract deployment.
