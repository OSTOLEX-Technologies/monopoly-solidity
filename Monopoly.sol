// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Jail.sol';
import './RoomController.sol';
import './PlayerController.sol';


contract Monopoly is Jail, RoomController, PlayerController {

    modifier onlyActivePlayer(uint256 roomId) {
        address activePlayer = RoomController.getCurrentPlayerAddress(roomId);
        require(
            activePlayer == msg.sender,
            "It is not you turn to make a move"
        );
        _;
    }

    function initNewRoom(address[] calldata players) external returns (uint256) {
        require (
            playersNotInGame(players),
            "Some players have an unfinished game"
        );

        uint256 roomId = createRoom(players);
        free(players);
        restartPlayers(players);
        assignPlayersToRoom(roomId, players);        

        return roomId;
    }
}