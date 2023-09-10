// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract RoomController {
    struct Room {
        address[] players;
        uint256 currentPlayerIndex;
        uint256 randomParameter;
    }

    mapping(uint256 => Room) public rooms;
    mapping(address => uint256) public playerInRoom;
    uint256 public numberOfRooms;

    constructor() {
        numberOfRooms = 0;
    }

    function playersNotInGame(address[] calldata players) public view returns (bool) {
        for (uint256 i = 0; i < players.length; i++) {
            if (playerInRoom[players[i]] != 0) {
                return false;
            }
        }
        return true;
    }

    function getCurrentPlayerIndex(uint256 roomId) public view returns(uint256) {
        Room storage room = rooms[roomId];

        return room.currentPlayerIndex;
    }

    function getCurrentPlayerAddress(uint256 roomId) public view returns(address) {
        Room storage room = rooms[roomId];
        uint256 currentPlayerIndex = getCurrentPlayerIndex(roomId);

        return room.players[currentPlayerIndex];
    }

    function switchPlayer(uint256 roomId) internal {
        Room storage room = rooms[roomId];
        uint256 numberOfPlayers = room.players.length;
        room.currentPlayerIndex++;
        room.currentPlayerIndex %= numberOfPlayers;
    }
    
    function createRoom(address[] calldata players) public returns (uint256) {
        require(
            playersNotInGame(players),
            "Players have some game unfinished"
        );

        numberOfRooms++;
        Room storage room = rooms[numberOfRooms]; 
        room.players = players;
        
        return numberOfRooms;
    }

        
}