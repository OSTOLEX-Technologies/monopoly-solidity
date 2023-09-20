// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './RandomGenerator.sol';
import './GameConstants.sol';

contract ChanceCardController is RandomGenerator {
    enum ActionType {
        Pay,
        Move
    }

    function viewNextActionType(uint256 roomId) public view returns(uint256) {
        uint256 random = (roomEntropy[roomId]) >> CHANCE_ACTION_TYPE_SHIFT;
        if (random % 2 == 0) {
            return uint256(ActionType.Pay);
        }
        return uint256(ActionType.Move);
    }

    function viewNextActionValue(uint256 roomId) public view returns(uint256) {
        uint256 random = (roomEntropy[roomId]) >> CHANCE_ACTION_VALUE_SHIFT;
        if(viewNextActionType(roomId) == uint256(ActionType.Move)) {
            return getValueWithinRange(random, CHANCE_MOVE_MIN, CHANCE_MOVE_MAX);
        } else {
            return getValueWithinRange(random, CHANCE_PAY_MIN, CHANCE_PAY_MAX);
        }
    }
}