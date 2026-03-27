// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Vault {

}

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault {
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

/// @notice Deposits tokens into the vault
/// @param amount Number of tokens to deposit
    function deposit(uint256 amount) public {
    token.transferFrom(msg.sender, address(this), amount);
    balances[msg.sender] += amount;
    }
}

/// @notice Withdraws tokens from the vault
/// @param amount Number of tokens to withdraw
function withdraw(uint256 amount) public {
    require(balances[msg.sender] >= amount, "Vault: amount exceeds deposited balance");
    token.transfer(msg.sender, amount);
}

mapping(address => uint256) public balances;