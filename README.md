# MyToken (MTK)

A simple ERC-20 token implementation on the Ethereum blockchain built using Solidity. This project demonstrates the core functionality of the ERC-20 token standard.

## Overview

MyToken is a beginner-friendly Solidity smart contract that implements the ERC-20 token standard. It includes all required functions for transferring tokens, approving spending on behalf of owners, and tracking balances.

## Token Details

- **Name**: MyToken
- **Symbol**: MTK
- **Decimals**: 18
- **Total Supply**: 1,000,000 MTK (1000000000000000000000000 in wei)
- **Standard**: ERC-20
- **Blockchain**: Ethereum

## Features

✅ Standard ERC-20 implementation
✅ Transfer tokens between addresses
✅ Approve and transferFrom functionality (allowance mechanism)
✅ Event emission for transparency
✅ Balance tracking for all addresses
✅ Input validation for security
✅ Clear and commented code

## Implemented Functions

### State Variables

- `name`: Token name ("MyToken")
- `symbol`: Token symbol ("MTK")
- `decimals`: Token decimal places (18)
- `totalSupply`: Total token supply
- `balanceOf`: Mapping to track token balances
- `allowance`: Nested mapping for approved spending amounts

### Public Functions

#### transfer(address _to, uint256 _value) → bool
Transfer tokens from the caller's account to another address.
- **Parameters**:
  - `_to`: Recipient address
  - `_value`: Number of tokens to transfer
- **Returns**: true on success
- **Events**: Emits Transfer event

#### approve(address _spender, uint256 _value) → bool
Allow a spender to withdraw tokens from your account multiple times, up to the _value amount.
- **Parameters**:
  - `_spender`: Address allowed to spend
  - `_value`: Maximum amount they can spend
- **Returns**: true on success
- **Events**: Emits Approval event

#### transferFrom(address _from, address _to, uint256 _value) → bool
Transfer tokens from one address to another (requires prior approval).
- **Parameters**:
  - `_from`: Source address
  - `_to`: Recipient address
  - `_value`: Number of tokens to transfer
- **Returns**: true on success
- **Events**: Emits Transfer event

#### balanceOf(address) → uint256
Get the token balance of an address.

#### allowance(address owner, address spender) → uint256
Get the remaining approved tokens for a spender.

## Events

### Transfer(address indexed from, address indexed to, uint256 value)
Emitted when tokens are transferred (including minting and burning).

### Approval(address indexed owner, address indexed spender, uint256 value)
Emitted when allowance is set.

## How to Deploy

### Using Remix IDE

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Create a new file named `MyToken.sol`
3. Copy the contract code from `contracts/MyToken.sol`
4. Compile the contract using Solidity 0.8.x or higher
5. Deploy to:
   - **JavaScript VM** for testing (recommended for beginners)
   - **Testnet** (Sepolia, Mumbai, etc.) for further testing
   - **Mainnet** (with real Ether) for production
6. Enter the total supply during deployment (e.g., 1000000000000000000000000 for 1M tokens)

### Using Truffle or Hardhat

You can also use development frameworks:

```bash
npm install -g truffle
truffle init
# Copy MyToken.sol to contracts/
truffle compile
truffle migrate
```

## Usage Examples

### Check Your Balance
```solidity
uint256 myBalance = token.balanceOf(myAddress);
```

### Transfer Tokens
```solidity
bool success = token.transfer(recipientAddress, 1000000000000000000); // Transfer 1 token
require(success, "Transfer failed");
```

### Approve Spending
```solidity
bool success = token.approve(spenderAddress, 5000000000000000000); // Approve 5 tokens
```

### Transfer On Behalf
```solidity
bool success = token.transferFrom(ownerAddress, recipientAddress, 1000000000000000000);
```

## Testing

The contract has been tested in Remix IDE with the following scenarios:

- ✅ Contract deploys successfully
- ✅ Token metadata is correct (name, symbol, decimals)
- ✅ Initial supply is assigned to deployer
- ✅ Transfer function works correctly
- ✅ Approve/TransferFrom mechanism works
- ✅ Events are emitted properly
- ✅ Zero address validation works
- ✅ Insufficient balance check works
- ✅ Insufficient allowance check works

## Security Considerations

While this is a learning implementation, here are the security measures included:

1. **Zero Address Check**: Prevents transfers to address(0)
2. **Balance Validation**: Ensures sufficient balance before transfer
3. **Allowance Validation**: Ensures sufficient allowance in transferFrom
4. **Solidity 0.8+**: Includes automatic overflow/underflow protection

## Learning Objectives

By studying this contract, you'll learn:

1. Solidity fundamentals and syntax
2. ERC-20 token standard implementation
3. Smart contract design patterns
4. Event emission for logging
5. Mapping and data structures
6. Input validation and security
7. How cryptocurrency tokens work
8. Blockchain interaction concepts

## Common ERC-20 Token Extensions

This basic implementation can be extended with:

- **Ownership control**: Only owner can mint/burn
- **Burning**: Destroy tokens permanently
- **Minting**: Create new tokens
- **Pausing**: Pause all transfers temporarily
- **Snapshots**: Historical balance tracking
- **Voting**: Governance tokens
- **Yield/Staking**: Rewards mechanism

## Resources

- [ERC-20 Standard](https://eips.ethereum.org/EIPS/eip-20)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Ethereum Development Documentation](https://ethereum.org/en/developers/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Remix IDE](https://remix.ethereum.org/)

## License

MIT License - This code is for educational purposes.

## Author

Sairam Venkata Tulasi

## Disclaimer

This is an educational implementation. For production use, always use audited token contracts from reputable sources like OpenZeppelin. This contract has not been audited and should not be used with real value without professional security review.
