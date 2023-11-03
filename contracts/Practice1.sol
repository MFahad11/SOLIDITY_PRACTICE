// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
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
    function payBill(address _address,uint _total) external{
            (bool result,)=_address.call{value:_total}("");
            require(result);
            uint share=address(this).balance/participants.length;
            for(uint i=0;i<participants.length;i++){
                (bool transfer, )=participants[i].call{value:share}("");
                require(transfer);
            }


    }
}