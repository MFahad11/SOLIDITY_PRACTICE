// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Switch {
    address public owner;
    uint public lastPinged;
    address public recipent;
    constructor(address _address) payable{
        owner=msg.sender;
        recipent=_address;
        lastPinged=block.timestamp;
    }
    function withdraw() external {
        require((lastPinged-block.timestamp)>=52 weeks);
        (bool result, )=recipent.call{value:address(this).balance}("");
        
    }
    function ping() external {
        require(msg.sender==owner);
        lastPinged=block.timestamp;

    }
}