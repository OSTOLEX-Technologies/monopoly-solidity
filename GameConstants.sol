// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameConstants {
    uint256 constant FIELD_SIZE = 36;
    uint256 constant MAX_DICE_VALUE = 6;
    uint256 constant UPGRADE_DELTA = 100;
    uint256 constant MOVES_TO_FREE = 3;
    uint256 constant CHANCE_ACTION_TYPE_SHIFT = 10;
    uint256 constant CHANCE_ACTION_VALUE_SHIFT = 25;
    uint256 constant CHANCE_MOVE_MIN = 2;
    uint256 constant CHANCE_MOVE_MAX = 12;
    uint256 constant CHANCE_PAY_MIN = 300;
    uint256 constant CHANCE_PAY_MAX = 1000;
    uint256 constant PLAYER_START_BALANCE = 15000;    
    uint256 constant MAX_PLAYER_AMOUNT = 8;
    uint256 constant TIME_FOR_TRADE_BLOCK = 20;
}
