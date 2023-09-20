// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Jail {
    mapping(address => bool) public  isInJail;

    function sendToJail(address player) internal  {
        isInJail[player] = true;
    }

    function free(address player) internal  {
        isInJail[player] = false;
    }
    
    function free(address[] calldata players) internal {
        for (uint256 i = 0; i < players.length; i++) {
            free(players[i]);
        }
    }

}