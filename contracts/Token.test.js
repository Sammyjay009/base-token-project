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

it("should burn tokens from caller", async function () {
  const { token, owner } = await loadFixture(deployToken);
  await token.mint(owner.address, 100);
  await token.burn(50);
  expect(await token.balanceOf(owner.address)).to.equal(50);
});

it("should revert if non-owner mints", async function () {
  const { token, user } = await loadFixture(deployToken);
  await expect(token.connect(user).mint(user.address, 100)).to.be.revertedWith("Not owner");
});

it("should block transfer when paused", async function () {
  const { token, owner, user } = await loadFixture(deployToken);
  await token.mint(owner.address, 500);
  await token.setPaused(true);
  await expect(token.transfer(user.address, 10)).to.be.revertedWith("Contract is paused");
});

it("should revert transfer above limit", async function () {
  const { token, owner, user } = await loadFixture(deployToken);
  await token.mint(owner.address, ethers.parseEther("5000"));
  await expect(token.transfer(user.address, ethers.parseEther("2000"))).to.be.revertedWith("Exceeds transfer limit");
});