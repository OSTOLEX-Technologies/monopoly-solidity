// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './GameConstants.sol';

contract RandomGenerator is GameConstants {
    uint256 entropy;

    constructor() {
        entropy = uint256(keccak256(abi.encodePacked(
            blockhash(block.number),
            block.timestamp,
            msg.sender
        )));
    }

    function getRandomNumber() public returns(uint256) {
        entropy = uint256(keccak256(abi.encodePacked(
            entropy,
            blockhash(block.number),
            gasleft()
        )));
        return entropy;
    }

    function getRandomDiceValue() public returns(uint256) {
        return 1 + getRandomNumber() % MAX_DICE_VALUE;
    }

}