// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Card {
    enum CardType {
        Property,
        Jail,
        SendToJail,
        Chance,
        CommunityChest,
        Fine,
        Start
    }

    string name;

    function executeCard() public { }

}