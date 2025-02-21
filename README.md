# Cross-Chain Token Swap

## Project Description
This project implements a cross-chain token swap contract with token bridging functionality. The contract allows users to initiate swaps to other blockchain networks and process completed swaps securely. It is written in Solidity without any imports or constructors, and it does not require input fields.

## Smart Contract Address
```
0x5408fFa37d8C6e4c7385523B54BBfF03Db95BE48
```

## Features
- Users can initiate token swaps to other chains.
- Swap transactions are uniquely identified using a hash.
- Prevents duplicate swaps using a mapping.
- Emits events for swap initiation and completion.

## How It Works
1. **Initiate Swap**: A user calls `initiateSwap(amount, destinationChain, destinationAddress)`, which generates a unique swap ID and records the swap.
2. **Complete Swap**: Once the swap is confirmed on the destination chain, the function `completeSwap(swapId, user, amount)` finalizes the transaction.

## Events
- `SwapInitiated(address indexed user, uint256 amount, bytes32 destinationChain, address destinationAddress)`
- `SwapCompleted(bytes32 indexed swapId, address indexed user, uint256 amount)`

## License
This project is open-source and available under the MIT License.
