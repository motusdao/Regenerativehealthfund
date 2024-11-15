require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
    solidity: "0.8.0",
    networks: {
        alfajores: {
            url: "https://alfajores-forno.celo-testnet.org",
            accounts: [process.env.PRIVATE_KEY],
        },
        celo: {
            url: "https://forno.celo.org",
            accounts: [process.env.PRIVATE_KEY],
        },
    },
};
