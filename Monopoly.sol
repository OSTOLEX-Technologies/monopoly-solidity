// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Jail.sol';
import './RoomController.sol';
import './PlayerController.sol';
import './RandomGenerator.sol';
import './BoardController.sol';


contract Monopoly is Jail, RoomController, PlayerController, RandomGenerator, BoardController {

    modifier onlyCurrentPlayer(uint256 roomId) {
        address currentPlayer = getCurrentPlayerAddress(roomId);
        require(
            currentPlayer == msg.sender,
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

    function makeMove(uint256 roomId, 
                      bool action,
                      uint16[] calldata cardsToUpgrade,
                      uint16[] calldata cardsToDowngrade) external
                                      onlyCurrentPlayer(roomId)
                                      returns (uint256) {
        uint256 diceValue = getRandomDiceValue(roomId);
        address currentPlayer = getCurrentPlayerAddress(roomId);
        
        // downgrade property
        uint256 downgradeCost = getDowngradeCost(cardsToDowngrade);
        increasePlayerBalance(currentPlayer, downgradeCost);

        // upgrade property
        uint256 upgradeCost = getUpgradeCost(cardsToUpgrade);
        decreasePlayerBalance(currentPlayer, upgradeCost);

        updatePosition(currentPlayer, diceValue);
        

        

        return diceValue;
    }

}