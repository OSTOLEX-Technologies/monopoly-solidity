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

        uint256 newPosition = updatePosition(currentPlayer, diceValue);
        
        if (action && isCardFree(roomId, newPosition)) {
            buyCard(roomId, newPosition);
        }

        if (isCardOwned(roomId, newPosition)) {
            payRent(roomId, newPosition);
        }

        if (isCardType(newPosition, CardType.Fine)) {
            payFine(roomId, newPosition);
        }

        if (isCardType(newPosition, CardType.SendToJail)) {
            sendToJail(roomId);
        }


        return diceValue;
    }

    function buyCard(uint256 roomId, uint256 position) internal {
        uint256 currentPlayerId = getCurrentPlayerIndex(roomId);
        address currentPlayerAddress = getCurrentPlayerAddress(roomId);

        require(
            isCardFree(roomId, position),
            "Property already has an owner"  
        );
        uint256 cardPrice = getCardPrice(position);
        require(
            getPlayerBalance(currentPlayerAddress) >= cardPrice,
            "Player does not have enough balance"
        );
        decreasePlayerBalance(currentPlayerAddress, cardPrice);
        setCardOwnerId(roomId, position, currentPlayerId);
    }

    function payRent(uint256 roomId, uint256 position) internal {
        address currentPlayerAddress = getCurrentPlayerAddress(roomId);

        uint256 rentPrice = getCardRent(roomId, position);
        decreasePlayerBalance(currentPlayerAddress, rentPrice);
    }

    function payFine(uint256 roomId, uint256 position) internal {
        address currentPlayerAddress = getCurrentPlayerAddress(roomId);

        uint256 fine = getCardPrice(position);
        decreasePlayerBalance(currentPlayerAddress, fine);
    }

    function sendToJail(uint256 roomId) internal {
        address currentPlayer = getCurrentPlayerAddress(roomId);
        Jail.sendToJail(currentPlayer);
    }
}