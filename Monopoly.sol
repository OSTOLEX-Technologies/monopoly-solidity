// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Jail.sol';

contract Monopoly is Jail {
    struct Room {
        address[] players;
        uint8 currentPlayerIndex;
        uint256 randomParameter;
    }

    mapping(uint256 => Room) public rooms;
    mapping(address => uint256) public playerInRoom;
    uint256 public numberOfRooms;

    constructor() {
        numberOfRooms = 0;
    }

    modifier onlyActivePlayer(uint256 roomId) {
        Room storage room = rooms[roomId];
        uint256 playerIndex = rooms[roomId].currentPlayerIndex;
        address activePlayer = room.players[playerIndex];
        require(
            rooms[roomId].players[playerIndex] == msg.sender,
            "It is not you turn to make a move"
        );
        _;
    }

    function createRoom(address[] calldata players) external returns (uint256) {
        Room storage room = rooms[numberOfRooms]; 
        room.players = players;
        
        numberOfRooms++;
        return numberOfRooms;
    }
}