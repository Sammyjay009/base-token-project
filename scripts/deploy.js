const Vault = await ethers.getContractFactory("Vault");
const vault = await Vault.deploy(await token.getAddress());
await vault.waitForDeployment();
console.log("Vault deployed to:", await vault.getAddress());