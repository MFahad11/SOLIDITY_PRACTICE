// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    Proposal[] public proposals;
    function newProposal(address _address,bytes calldata _calldata) public {
        proposals.push(Proposal(_address,_calldata,0,0));
    }
    
}
