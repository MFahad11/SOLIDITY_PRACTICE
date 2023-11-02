// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract HotelRoom{
    address payable public owner;
    enum Statuses {VACANT,OCCUPIED}
    Statuses public currentStatus;
    constructor(){
        owner=payable(msg.sender); //msg.sender ko payable mein wrap karna hai
        currentStatus=Statuses.VACANT;
    }
    modifier  onlyWhileVacant{
        require(currentStatus==Statuses.VACANT,"Currently Occupied");
        _;

    }
    modifier costs(uint _amount){
        require(msg.value>=_amount,"Not enough ether");
        _;
    }
    event Occupy(address _occupant,uint _value);
    function bookRoom() public payable onlyWhileVacant costs(2 ether){
        currentStatus=Statuses.OCCUPIED;
        owner.transfer(msg.value);
        (bool sent,bytes memory data)=owner.call{value:msg.value}("");
        require(sent);
        emit Occupy(msg.sender,msg.value);
    }
}