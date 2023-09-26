// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './GameConstants.sol';
import './RoomController.sol';

contract PlayerQueueController is GameConstants, RoomController {
    address[] players;
    uint256 roomValidUntilBlock;

    event RoomCreated(uint256 roomId);

    function joinRoom() external {
        if (block.number > roomValidUntilBlock) {
            clearWaitingRoom();
        }
        address player = msg.sender;
        players.push(player);
        if (players.length == DEFAULT_NUMBER_OF_PLAYERS) {
            numberOfRooms++;
            Room storage room = rooms[numberOfRooms]; 
            room.players = players;
            emit RoomCreated(numberOfRooms);
        }
    }

    function clearWaitingRoom() internal {
        while(players.length > 0) {
            players.pop();
        }
    }

}