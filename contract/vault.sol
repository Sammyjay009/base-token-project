// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault {
    IERC20 public token;
    mapping(address => uint256) public balances;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        token = IERC20(_token);
    }

    /// @notice Deposits tokens into the vault
    /// @param amount Number of tokens to deposit
    function deposit(uint256 amount) public {
        token.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] += amount;
        emit Deposited(msg.sender, amount);
    }

    /// @notice Withdraws tokens from the vault
    /// @param amount Number of tokens to withdraw
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Vault: amount exceeds deposited balance");
        balances[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}