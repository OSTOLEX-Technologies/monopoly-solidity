// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Jail.sol';
import './RoomController.sol';


contract Monopoly is Jail, RoomController {

    modifier onlyActivePlayer(uint256 roomId) {
        address activePlayer = RoomController.getCurrentPlayerAddress(roomId);
        require(
            activePlayer == msg.sender,
            "It is not you turn to make a move"
        );
        _;
    }

    function initNewRoom(address[] calldata players) external returns (uint256) {
        RoomController.createRoom(players);        
        Jail.free(players);

        return RoomController.numberOfRooms;
    }
}