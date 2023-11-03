// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    uint256 public amount;
    address[] public participants;
    mapping (address=>bool) payment;
	constructor(uint256 _amount){
        amount=_amount;
    }
    function rsvp() external payable {
        require(msg.value==amount);
        require(!payment[msg.sender]);
        participants.push(msg.sender);
        payment[msg.sender]=true;
    }
}