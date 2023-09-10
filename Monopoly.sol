// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Monopoly {
    struct Room {
        address[] players;
        uint8 currentPlayerIndex;
        uint256 randomParameter;
    }

    mapping(uint256 => Room) public rooms;
    mapping(address => uint256) public playerInRoom;
    uint256 public countRooms;

    constructor() {
        countRooms = 0;
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
}