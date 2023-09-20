// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './GameConstants.sol';

contract Jail is GameConstants{
    mapping(address => bool) public  isInJail;
    mapping(address => uint256) public movesToFree;

    function sendToJail(address player) internal  {
        isInJail[player] = true;
        movesToFree[player] = MOVES_TO_FREE;
    }

    function free(address player) internal  {
        isInJail[player] = false;
        movesToFree[player] = 0;
    }
    
    function free(address[] calldata players) internal {
        for (uint256 i = 0; i < players.length; i++) {
            free(players[i]);
        }
    }

    function playerMadeMove(address player) internal  {
        if (!isInJail[player]) {
            return;
        }
        if(movesToFree[player] == 1) {
            free(player);
        }
        movesToFree[player] -= 1;
    }

}