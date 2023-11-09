// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract token{
string public name = "MuhammadFahad";
	string public symbol = "MFC";
	uint8 public decimals = 18;

	uint256 public totalSupply;
	mapping (address => uint256) balances;

	constructor(){
		totalSupply=1000*(10**18);
        balances[msg.sender]=totalSupply;
	}    
	event Transfer(address indexed _sender, address indexed _receiver, uint256 _amount);
	function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
	function transfer(address _address, uint _amount) public returns(bool result){
		require(balances[msg.sender]>=_amount,"Insufficient amount!!");
        (bool sent,)=_address.call{value:balances[msg.sender]}("");
		balances[msg.sender]=balances[msg.sender]-_amount;
		balances[_address]=balances[_address]+_amount;
		// require(sent,"Failed!!");
		emit Transfer(msg.sender,_address,_amount);
		return sent;
	}

}