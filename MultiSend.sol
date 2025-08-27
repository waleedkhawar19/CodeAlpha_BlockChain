// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSend {
    // Payable function to distribute Ether equally
    function distribute(address payable[] calldata recipients) external payable {
        require(recipients.length > 0, "No recipients provided");
        require(msg.value > 0, "No Ether sent");

        // Calculate amount per recipient
        uint256 amount = msg.value / recipients.length;

        require(amount > 0, "Not enough Ether to split");

        // Send Ether to each address
        for (uint256 i = 0; i < recipients.length; i++) {
            (bool success, ) = recipients[i].call{value: amount}("");
            require(success, "Transfer failed");
        }

        // If there's leftover wei (due to division), refund sender
        uint256 remainder = msg.value - (amount * recipients.length);
        if (remainder > 0) {
            (bool refundSuccess, ) = payable(msg.sender).call{value: remainder}("");
            require(refundSuccess, "Refund failed");
        }
    }
}
