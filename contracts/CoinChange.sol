// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinChange {
    event ChangeReturned(address indexed user, uint256 amountDue, uint256 amountPaid, uint256[] coins);
    event AdditionPerformed(address indexed user, uint256 a, uint256 b, uint256 result);
    event SubtractionPerformed(address indexed user, uint256 a, uint256 b, uint256 result);
    event MultiplicationPerformed(address indexed user, uint256 a, uint256 b, uint256 result);
    event DivisionPerformed(address indexed user, uint256 a, uint256 b, uint256 result);
    
    function changeReturn(uint256 amountDue, uint256 amountPaid) external returns (uint256[] memory) {
        uint256 changeDue = amountPaid - amountDue;
        
        uint256[] memory coins = new uint256[](4);
        
        coins[0] = changeDue / 25;  // Number of quarters (25 cents)
        changeDue = changeDue % 25; // Remaining change
        
        coins[1] = changeDue / 10;  // Number of dimes (10 cents)
        changeDue = changeDue % 10; // Remaining change
        
        coins[2] = changeDue / 5;   // Number of nickels (5 cents)
        changeDue = changeDue % 5;  // Remaining change
        
        coins[3] = changeDue;       // Number of pennies (1 cent)
        
        emit ChangeReturned(msg.sender, amountDue, amountPaid, coins);
        
        return coins;
    }
    
    function performAddition(uint256 a, uint256 b) external returns (uint256) {
        uint256 result = a + b;
        
        emit AdditionPerformed(msg.sender, a, b, result);
        
        return result;
    }
    
    function performSubtraction(uint256 a, uint256 b) external returns (uint256) {
        require(a >= b, "Subtraction error: Result would be negative");
        
        uint256 result = a - b;
        
        emit SubtractionPerformed(msg.sender, a, b, result);
        
        return result;
    }
    
    function performMultiplication(uint256 a, uint256 b) external returns (uint256) {
        uint256 result = a * b;
        
        emit MultiplicationPerformed(msg.sender, a, b, result);
        
        return result;
    }
    
    function performDivision(uint256 a, uint256 b) external returns (uint256) {
        require(b != 0, "Division error: Cannot divide by zero");
        
        uint256 result = a / b;
        
        emit DivisionPerformed(msg.sender, a, b, result);
        
        return result;
    }
}
