const { expect } = require("chai");
const { ethers } = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers");

describe("Token", function () {
  // tests coming
  async function deployToken() {
  const [owner, user] = await ethers.getSigners();
  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy();
  return { token, owner, user };
}
});

it("should mint tokens to owner", async function () {
  const { token, owner } = await loadFixture(deployToken);
  await token.mint(owner.address, 100);
  expect(await token.balanceOf(owner.address)).to.equal(100);
});