// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract TradeController {
    struct Trade {
        address agent;
        address contragent;
        int256 balanceChange;
        uint16[] agentOfferedCards;
        uint16[] contragentOfferedCards;
    }
    Trade currentTrade;
    uint256 tradeActiveUntil;

    function 
}