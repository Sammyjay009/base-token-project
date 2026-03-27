# Base Token Project

![License](https://img.shields.io/badge/license-MIT-blue)
![Network](https://img.shields.io/badge/network-Base%20Sepolia-blue)

A simple ERC-20 token and Vault contract deployed on Base (Ethereum L2).

## What this project does
- ERC-20 token with mint, burn, and pause functionality
- Vault contract for depositing and withdrawing tokens
- Deployed on Base Sepolia testnet

## Built with
- Solidity
- Hardhat
- OpenZeppelin
- Base (L2)
## Setup

1. Clone this repo
2. Run `npm install`
3. Copy `.env.example` to `.env` and fill in your private key
4. Run `npx hardhat compile`

## Usage
```js
// Mint tokens (owner only)
await token.mint("0xYourAddress", ethers.parseEther("100"));

// Deposit into Vault
await token.approve(vaultAddress, ethers.parseEther("50"));
await vault.deposit(ethers.parseEther("50"));
```

## Deployments

| Network | Address |
|---|---|
| Base Sepolia | `0xYourAddressHere` |

## How it works

1. Owner deploys the Token contract
2. Owner mints tokens to any address
3. Users can transfer tokens within the transfer limit
4. Owner can pause all transfers at any time
5. Users can burn their own tokens

## Security

This project is unaudited and for educational purposes only.
Do not use with real funds without a professional audit.

## Frontend

Open `frontend/index.html` in your browser with MetaMask installed.
Connect your wallet, switch to Base Sepolia, and interact with the contracts.

add a "Topics" or "Tags" line at the bottom