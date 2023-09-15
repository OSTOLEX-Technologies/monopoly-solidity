// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlayerController {
    struct Player {
        uint256 money;
        uint256 freeJailCards;
        uint256 position;    
    }

    mapping(address => Player) playerData;

    function updatePosition(address playerAddress, 
                            uint256 positionChange
    ) internal returns (uint256) {
        Player storage player = playerData[playerAddress];
        player.position += positionChange;
        return player.position;
    }

    function restartPlayers(address[] calldata players) internal {
        for (uint256 i = 0; i < players.length; i++) {
            Player storage player = playerData[players[i]];
            player.money = 0;
            player.freeJailCards = 0;
            player.position = 0;
        }
    }


}