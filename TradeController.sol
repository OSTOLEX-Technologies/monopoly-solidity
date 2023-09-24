// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract TradeController {
    struct Trade {
        address agent;
        address counteragent;
        int256 balanceChange; // agent - balance | contragent
        uint16[] agentOfferedCards;
        uint16[] counteragentOfferedCards;
        uint256 activeUntilBlock;
    }

    mapping(uint256 => Trade) tradeInRoom;

    function isTradeActive(uint256 roomId) public view returns(bool) {
        Trade storage trade = tradeInRoom[roomId];

        uint256 currentBlockNumber = block.number;
        uint256 tradeActiveUntilBlock = trade.activeUntilBlock;

        return currentBlockNumber > tradeActiveUntilBlock;
    }

    function getCurrentTradeAgent(uint256 roomId) public view returns(address) {
        Trade storage trade = tradeInRoom[roomId];
        return trade.agent;
    }

    function getCurrentTradeCounteragent(uint256 roomId) public view returns(address) {
        Trade storage trade = tradeInRoom[roomId];
        return trade.counteragent;
    }

}