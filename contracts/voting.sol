// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    struct Contest {
        uint id;
        string name;
        mapping(uint => Candidate) candidates;
        mapping(address => bool) voters;
        uint candidatesCount;
        uint votesCount;
    }

    mapping(uint => Contest) public contests;
    uint public contestsCount;

    event ContestCreated(uint indexed contestId, string name);
    event CandidateAdded(uint indexed contestId, uint indexed candidateId, string name);
    event Voted(uint indexed contestId, uint indexed candidateId);

    function createContest(string memory _name) public {
        contestsCount++;
        Contest storage newContest = contests[contestsCount];
        newContest.id = contestsCount;
        newContest.name = _name;

        emit ContestCreated(contestsCount, _name);
    }

    function addCandidate(uint _contestId, string memory _name) public {
        require(_contestId > 0 && _contestId <= contestsCount, "Invalid contest ID.");
        Contest storage contest = contests[_contestId];
        contest.candidatesCount++;
        contest.candidates[contest.candidatesCount] = Candidate(contest.candidatesCount, _name, 0);

        emit CandidateAdded(_contestId, contest.candidatesCount, _name);
    }

    function vote(uint _contestId, uint _candidateId) public {
        require(_contestId > 0 && _contestId <= contestsCount, "Invalid contest ID.");
        Contest storage contest = contests[_contestId];
        require(!contest.voters[msg.sender], "You have already voted in this contest.");
        require(_candidateId > 0 && _candidateId <= contest.candidatesCount, "Invalid candidate ID.");

        contest.voters[msg.sender] = true;
        contest.candidates[_candidateId].voteCount++;
        contest.votesCount++;

        emit Voted(_contestId, _candidateId);
    }

    function getContest(uint _contestId) public view returns (uint, string memory, uint, uint) {
        require(_contestId > 0 && _contestId <= contestsCount, "Invalid contest ID.");
        Contest storage contest = contests[_contestId];
        return (contest.id, contest.name, contest.candidatesCount, contest.votesCount);
    }

    function getCandidate(uint _contestId, uint _candidateId) public view returns (uint, string memory, uint) {
        require(_contestId > 0 && _contestId <= contestsCount, "Invalid contest ID.");
        Contest storage contest = contests[_contestId];
        require(_candidateId > 0 && _candidateId <= contest.candidatesCount, "Invalid candidate ID.");
        Candidate storage candidate = contest.candidates[_candidateId];
        return (candidate.id, candidate.name, candidate.voteCount);
    }
}
