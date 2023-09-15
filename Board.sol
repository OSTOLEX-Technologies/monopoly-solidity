// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './CardController.sol';
import './GameConstants.sol';

contract BoardController is CardController {
    mapping(uint256 => Card) monopolyField;

    // MONOPOLY FIELD DATA
    constructor() {
        monopolyField[0] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[1] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[2] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[3] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[4] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[5] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[6] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[7] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[8] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[9] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[10] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[11] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[12] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[13] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[14] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[15] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[16] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[17] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[18] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[19] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[20] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[21] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[22] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[23] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[24] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[25] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[26] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[27] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[28] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[29] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[30] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[31] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[32] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[33] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[34] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[35] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });

        monopolyField[36] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200,
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
    }

    // END OF MONOPOLY FIELD DATA

    struct Board {
        mapping(uint256 => uint256) cardPositionToOwnerId;
        mapping(uint256 => uint256) cardPositionToLevel;        
    }
}