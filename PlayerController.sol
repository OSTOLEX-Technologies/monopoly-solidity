// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './GameConstants.sol';

contract PlayerController is GameConstants {
    struct Player {
        uint256 balance;
        uint256 freeJailCards;
        uint256 position;    
    }

    mapping(address => Player) playerData;

    function updatePosition(address playerAddress, 
                            uint256 positionChange
    ) internal returns (uint256) {
        Player storage player = playerData[playerAddress];
        player.position = (player.position + positionChange) % FIELD_SIZE;

        return player.position;
    }

    function restartPlayers(address[] calldata players) internal {
        for (uint256 i = 0; i < players.length; i++) {
            Player storage player = playerData[players[i]];
            player.balance = 0;
            player.freeJailCards = 0;
            player.position = 0;
        }
    }

    function getPlayerPosition(address playerAddress) public view returns(uint256) {
        Player storage player = playerData[playerAddress];
        return player.position;
    }

    function getPlayerBalance(address playerAddress) public view returns(uint256) {
        Player storage player = playerData[playerAddress];
        return player.balance;
    }


}