// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Token {

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token {

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public owner;

    constructor(transferLimit = 1000 * 10 ** decimals();) ERC20("SammyToken", "SMT") {
        owner = msg.sender;
    }

modifier onlyOwner() {
    require(msg.sender == owner, "Not owner");
    _;
    uint256 public transferLimit;
}

    function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
    }
}
function burn(uint256 amount) public {
    _burn(msg.sender, amount);
}

function transfer(address to, uint256 amount) public override returns (bool) {
    require(amount <= transferLimit, "Exceeds transfer limit");
    return super.transfer(to, amount);
}
function setTransferLimit(uint256 newLimit) public onlyOwner {
    transferLimit = newLimit;
}