// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public owner;
    uint256 public transferLimit;
    bool public paused;

    event Minted(address indexed to, uint256 amount);
    event Burned(address indexed from, uint256 amount);

    /// @notice Deploys the token and sets the owner
    constructor() ERC20("SammyToken", "SMT") {
        owner = msg.sender;
        transferLimit = 1000 * 10 ** decimals();
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    /// @notice Mints new tokens to a given address
    /// @param to The recipient address
    /// @param amount The number of tokens to mint
    function mint(address to, uint256 amount) public onlyOwner whenNotPaused {
        _mint(to, amount);
        emit Minted(to, amount);
    }

    /// @notice Burns tokens from the caller's balance
    /// @param amount The number of tokens to burn
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burned(msg.sender, amount);
    }

    function transfer(
        address to,
        uint256 amount
    ) public override whenNotPaused returns (bool) {
        require(amount <= transferLimit, "Exceeds transfer limit");
        return super.transfer(to, amount);
    }

    // Maximum tokens per transfer
    function setTransferLimit(uint256 newLimit) public onlyOwner {
        transferLimit = newLimit;
    }

    function setPaused(bool _paused) public onlyOwner {
        paused = _paused;
    }
}
