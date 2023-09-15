// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CardController {
    enum CardType {
        Property,
        Jail,
        SendToJail,
        Chance,
        CommunityChest,
        Fine,
        Start
    }
    struct Card {
        string name;
        CardType cardType;
        uint256 price;
        uint16[6] rentPrices;
    }
}