// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomNumberGenerator {
    uint256 entropy;

    constructor() {
        entropy = uint256(keccak256(abi.encodePacked(
            blockhash(block.number),
            block.timestamp,
            block.difficulty,
            msg.sender
        )));
    }

    function getRandomNumber() external returns(uint256) {
        entropy = uint256(keccak256(abi.encodePacked(
            entropy,
            blockhash(block.number),
            gasleft()
        )));
        return entropy;
    }
}