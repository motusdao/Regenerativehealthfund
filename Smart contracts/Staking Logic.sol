// State variables
IERC20 public immutable token; // ERC20 token for staking
mapping(address => uint256) public stakes; // Tracks each user's staked balance
mapping(address => uint256) public rewards; // Tracks rewards accrued by each user
uint256 public totalStaked; // Total amount of tokens staked in the contract

// Events
event Staked(address indexed user, uint256 amount);
event Withdrawn(address indexed user, uint256 amount);
event RewardsDistributed(address indexed user, uint256 reward);

/**
 * @notice Initializes the staking contract with the specified ERC20 token.
 * @param tokenAddress The address of the ERC20 token to be staked.
 */
constructor(address tokenAddress) {
    require(tokenAddress != address(0), "Token address cannot be zero");
    token = IERC20(tokenAddress);
}

/**
 * @notice Allows a user to stake a specified amount of tokens.
 * @param amount The amount of tokens to stake.
 */
function stake(uint256 amount) external {
    require(amount > 0, "Amount must be greater than zero");

    // Transfer tokens from the user to the contract
    token.safeTransferFrom(msg.sender, address(this), amount);

    // Update the user's stake and the total staked balance
    stakes[msg.sender] += amount;
    totalStaked += amount;

    emit Staked(msg.sender, amount);
}

/**
 * @notice Allows a user to withdraw a specified amount of their staked tokens.
 * @param amount The amount of tokens to withdraw.
 */
function withdraw(uint256 amount) external {
    require(stakes[msg.sender] >= amount, "Insufficient balance to withdraw");

    // Update user's stake and the total staked balance
    stakes[msg.sender] -= amount;
    totalStaked -= amount;

    // Transfer the specified amount of tokens back to the user
    token.safeTransfer(msg.sender, amount);

    emit Withdrawn(msg.sender, amount);
}

/**
 * @notice Distributes rewards to the caller based on their staked balance.
 * @dev This is a simple example of rewards distribution; in practice, you can customize the logic.
 */
function distributeRewards() external {
    uint256 userStake = stakes[msg.sender];
    require(userStake > 0, "No stakes found for user");

    // Example reward logic: 1% of staked amount (customize as needed)
    uint256 reward = userStake / 100;

    // Update the rewards balance
    rewards[msg.sender] += reward;

    emit RewardsDistributed(msg.sender, reward);
}

/**
 * @notice Retrieves the current staked balance of the caller.
 * @return The staked balance of the caller.
 */
function getStakeBalance() external view returns (uint256) {
    return stakes[msg.sender];
}

/**
 * @notice Retrieves the accumulated rewards of the caller.
 * @return The accumulated rewards of the caller.
 */
function getRewardsBalance() external view returns (uint256) {
    return rewards[msg.sender];
}

