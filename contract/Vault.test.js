const { expect } = require("chai");
const { ethers } = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers");

describe("Vault", function () {
  async function deployVault() {
    const [owner, user] = await ethers.getSigners();
    const Token = await ethers.getContractFactory("Token");
    const token = await Token.deploy();
    const Vault = await ethers.getContractFactory("Vault");
    const vault = await Vault.deploy(await token.getAddress());
    return { token, vault, owner, user };
  }
});

it("should record deposit balance", async function () {
  const { token, vault, owner } = await loadFixture(deployVault);
  await token.mint(owner.address, 500);
  await token.approve(await vault.getAddress(), 500);
  await vault.deposit(100);
  expect(await vault.balances(owner.address)).to.equal(100);
});