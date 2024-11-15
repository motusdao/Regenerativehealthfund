// scripts/deploy.js

async function main() {
    // Import the ethers.js library provided by Hardhat
    const { ethers } = require("hardhat");

    // We get the contract factory to deploy our ERC-20 token
    const Token = await ethers.getContractFactory("RegenerativeHealthToken");

    // Define the initial supply for the token (adjust as needed)
    const initialSupply = ethers.utils.parseUnits("1000000", 18); // 1,000,000 tokens with 18 decimals

    console.log("Deploying RegenerativeHealthToken...");

    // Deploy the contract and pass in the initial supply as the constructor parameter
    const token = await Token.deploy(initialSupply);

    // Wait for the contract deployment to be mined
    await token.deployed();

    // Output the deployed contract address
    console.log(`RegenerativeHealthToken deployed to: ${token.address}`);
}

// Recommended pattern to handle errors and run the main function
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
