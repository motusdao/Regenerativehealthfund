const { ethers } = require("hardhat");

async function main() {
    const tokenAddress = "0xB80ca7962F1c28792a242200086fab43AF73Ce40"; // Replace with your deployed address
    const Token = await ethers.getContractFactory("PSYToken");
    const token = Token.attach(tokenAddress);

    const recipient = "RECIPIENT_ADDRESS"; // Replace with the recipient's address
    const amount = ethers.utils.parseUnits("100", 18); // Mint 100 tokens

    console.log(`Minting ${amount.toString()} tokens to ${recipient}`);
    const tx = await token.mint(recipient, amount);
    await tx.wait();
    console.log("Tokens minted successfully.");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
