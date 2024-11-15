from web3 import Web3

# Connect to the Celo network (change to your RPC endpoint)
provider_url = "https://alfajores-forno.celo-testnet.org"
web3 = Web3(Web3.HTTPProvider(provider_url))

# Check connection status
if web3.isConnected():
    print("Connected to Celo network")
else:
    print("Failed to connect to Celo network")

# Replace with your contract address and ABI
contract_address = "0xYourContractAddress"
abi = [...]  # Replace with your contract's ABI

# Load the contract
contract = web3.eth.contract(address=contract_address, abi=abi)

# Example interaction: Reading token balance
address = "0xYourAddress"
balance = contract.functions.balanceOf(address).call()
print(f"Token balance of {address}: {balance}")

import pandas as pd

# Example data - replace with your actual data source
data = {
    "User": ["Alice", "Bob", "Charlie"],
    "Tokens Staked": [1000, 2000, 1500],
    "Rewards Earned": [50, 100, 75]
}

df = pd.DataFrame(data)
print("Staking Data:")
print(df)

# Generate a summary report
total_staked = df["Tokens Staked"].sum()
total_rewards = df["Rewards Earned"].sum()
print(f"Total Tokens Staked: {total_staked}")
print(f"Total Rewards Distributed: {total_rewards}")


import requests

# Example: Fetching token price data (replace with a real API endpoint)
response = requests.get("https://api.example.com/token-price")
if response.status_code == 200:
    data = response.json()
    print(f"Token Price: {data['price']} USD")
else:
    print("Failed to fetch token price data")
