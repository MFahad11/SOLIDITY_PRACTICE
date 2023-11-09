// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
contract TestTokenF is ERC20Capped,ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;
    constructor(uint256 cap, uint256 reward) ERC20("TokenF","TKF") ERC20Capped(cap*(10**decimals())){
        owner=payable(msg.sender);

        _mint(msg.sender,70000000*(10**decimals()));
        blockReward=reward*(10**decimals());
    }
    
    function _update(address from, address to, uint256 value) internal virtual override(ERC20Capped,ERC20) {
        super._update(from, to, value);

        if (from == address(0) && to !=block.coinbase && block.coinbase!=address(0)) {
            uint256 maxSupply = cap();
            uint256 supply = totalSupply();
            if (supply > maxSupply) {
                revert ERC20ExceededCap(supply, maxSupply);
            }
        }
    }
    function _mintMinerReward() internal {
        _mint(block.coinbase,blockReward);
    }
    // function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20Capped){
        
    //     if(from==address(0) && to !=block.coinbase && block.coinbase!=address(0)){ //check for valid address
    //         _mintMinerReward();
    //     }
    //     super._beforeTokenTransfer(from, to, amount);
    // }
    modifier onlyOwner(){
        require(msg.sender==owner,"Only owner can call this function");
        _;
    }
    function destroy() public onlyOwner {

        owner.transfer(address(this).balance);
    }
    function setBlockReward(uint256 reward) public onlyOwner {
        
        blockReward=reward*(10**decimals());
    }
    self
    
}