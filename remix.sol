pragma solidity ^0.8.0;

contract CrossChainSwap {
    mapping(bytes32 => bool) public processedSwaps;
    event SwapInitiated(address indexed user, uint256 amount, bytes32 destinationChain, address destinationAddress);
    event SwapCompleted(bytes32 indexed swapId, address indexed user, uint256 amount);

    function initiateSwap(uint256 amount, bytes32 destinationChain, address destinationAddress) public {
        bytes32 swapId = keccak256(abi.encodePacked(msg.sender, amount, destinationChain, destinationAddress, block.timestamp));
        require(!processedSwaps[swapId], "Swap already processed");
        processedSwaps[swapId] = true;
        emit SwapInitiated(msg.sender, amount, destinationChain, destinationAddress);
    }

    function completeSwap(bytes32 swapId, address user, uint256 amount) public {
        require(!processedSwaps[swapId], "Swap already completed");
        processedSwaps[swapId] = true;
        emit SwapCompleted(swapId, user, amount);
    }
}
