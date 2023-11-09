// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract EscrowContract {
    address public buyer;
    address public seller;
    uint public amount;
    bool public buyerConfirmed;
    bool public sellerConfirmed;

    constructor(address _seller) payable {
        buyer = msg.sender;
        seller = _seller;
        amount = msg.value;
    }

    function confirmDelivery() public {
        require(msg.sender == buyer || msg.sender == seller, "Only buyer or seller can confirm delivery.");
        
        if (msg.sender == buyer) {
            buyerConfirmed = true;
        } else if (msg.sender == seller) {
            sellerConfirmed = true;
        }

        if (buyerConfirmed && sellerConfirmed) {
            payable(seller).transfer(amount);
        }
    }

    function refund() public {
        require(msg.sender == buyer, "Only buyer can initiate refund.");
        require(!buyerConfirmed || !sellerConfirmed, "Cannot refund after both parties have confirmed delivery.");

        payable(buyer).transfer(amount);
    }
}
