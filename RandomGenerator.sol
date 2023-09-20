// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './GameConstants.sol';

contract RandomGenerator is GameConstants {
    uint256 generalEntropy;
    // Dice value should be known for 1 step for a specific room
    // This way we can batch all data into one transaction 
    mapping(uint256 => uint256) roomEntropy;

    constructor() {
        generalEntropy = uint256(keccak256(abi.encodePacked(
            blockhash(block.number),
            block.timestamp,
            msg.sender
        )));
    }

    function createRoomEntropy(uint256 roomId) internal returns(uint256) {
        uint256 entropy = getRandomNumber();
        roomEntropy[roomId] = entropy;
        return entropy;
    }

    function getRandomNumber() public returns(uint256) {
        generalEntropy = uint256(keccak256(abi.encodePacked(
            generalEntropy,
            blockhash(block.number),
            gasleft()
        )));
        return generalEntropy;
    }

    function updateRandomValueInRoom(uint256 roomId) internal {
        roomEntropy[roomId] ^= getRandomNumber();
    }

    function getRandomDiceValue(uint256 roomId) public returns(uint256) {
        uint256 entropy = roomEntropy[roomId];
        uint256 diceValue = 1 + entropy % MAX_DICE_VALUE;

        roomEntropy[roomId] ^= getRandomNumber();

        return diceValue;
    }

    // Does not update entropy
    function viewDiceValue(uint256 roomId) public view returns(uint256) {
        return 1 + roomEntropy[roomId] % MAX_DICE_VALUE;
    }

    function getValueWithinRange(uint256 value,
                                 uint256 min,
                                 uint256 max) public pure returns(uint256) {
        require(max > min, "Maximal value should be greater than minimal");
        return min + (value % (max - min + 1));
    }
}