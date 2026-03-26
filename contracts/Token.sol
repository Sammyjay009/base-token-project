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

    constructor() ERC20("SammyToken", "SMT") {
        owner = msg.sender;
    }

modifier onlyOwner() {
    require(msg.sender == owner, "Not owner");
    _;
}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}