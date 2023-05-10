// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinChange {
    function changeReturn(uint256 amountDue, uint256 amountPaid) external pure returns (uint256[] memory) {
        uint256 changeDue = amountPaid - amountDue;
        
        uint256[] memory coins = new uint256[](4);
        
        coins[0] = changeDue / 25;  // Number of quarters (25 cents)
        changeDue = changeDue % 25; // Remaining change
        
        coins[1] = changeDue / 10;  // Number of dimes (10 cents)
        changeDue = changeDue % 10; // Remaining change
        
        coins[2] = changeDue / 5;   // Number of nickels (5 cents)
        changeDue = changeDue % 5;  // Remaining change
        
        coins[3] = changeDue;       // Number of pennies (1 cent)
        
        return coins;
    }
}
