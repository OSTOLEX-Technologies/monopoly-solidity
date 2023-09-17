// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './CardController.sol';
import './GameConstants.sol';
import './BoardField.sol';

contract BoardController is BoardField, GameConstants {
    mapping(uint256 => Board) roomBoard;

    struct Board {
        mapping(uint256 => uint256) cardPositionToOwnerId; // 0 -> bank | 1 -> 1st player (0 index)
        mapping(uint256 => uint256) cardPositionToLevel;        
    }

    function getDowngradeCost(uint16[] calldata cards) internal view returns(uint256) {
        uint256 totalCost = 0;
        for (uint256 i = 0; i < cards.length; i++) {
            Card storage card = monopolyField[cards[i]];
            totalCost += card.price / 2;
        }
        return totalCost;
    }

    function getUpgradeCost(uint16[] calldata cards) internal view returns(uint256) {
        return getDowngradeCost(cards) + (cards.length) * UPGRADE_DELTA;
    }

    function upgradeCards(uint256 roomId, uint16[] calldata cards) internal returns(bool) {
        for (uint256 i = 0; i < cards.length; i++) {
            Card storage card = monopolyField[cards[i]];
            require(
                card.cardType == CardType.Property,
                "Card is not property, you cannot upgrade it"
            );
            Board storage board = roomBoard[roomId];
            board.cardPositionToLevel[cards[i]] += 1;
        }
        return true;
    }

    function downgradeCards(uint256 roomId, uint16[] calldata cards) internal returns(bool) {
        for (uint256 i = 0; i < cards.length; i++) {
            Card storage card = monopolyField[cards[i]];
            require(
                card.cardType == CardType.Property,
                "Card is not property, you cannot upgrade it"
            );
            Board storage board = roomBoard[roomId];
            board.cardPositionToLevel[cards[i]] -= 1;
        }
        return true;
    }

    function isCardFree(uint256 roomId, uint256 position) public view returns(bool) {
        Board storage board = roomBoard[roomId];
        if (!isProperty(position)) {
            return false;
        }
        return board.cardPositionToOwnerId[position] != 0;
    }

    function isCardOwned(uint256 roomId, uint256 position) public view returns(bool) {
        Board storage board = roomBoard[roomId];
        if (!isProperty(position)) {
            return false;
        }
        return board.cardPositionToOwnerId[position] == 0;
    }

    function isCardType(uint256 position, CardType cardType) public view returns(bool) {
        return monopolyField[position].cardType == cardType;
    }

    function isProperty(uint256 position) public view returns(bool) {
        return monopolyField[position].cardType == CardType.Property;
    }

    function getCardPrice(uint256 position) public view returns(uint256) {
        return monopolyField[position].price;
    }

    function getCardOwnerId(uint256 roomId, uint256 position) public view returns(uint256) {
        Board storage board = roomBoard[roomId];
        return board.cardPositionToOwnerId[position];
    }

    function setCardOwnerId(uint256 roomId, uint256 position, uint256 ownerId) internal {
        Board storage board = roomBoard[roomId];
        board.cardPositionToOwnerId[position] = ownerId;
    }
}