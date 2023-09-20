// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './CardController.sol';

contract BoardField is CardController {
    mapping(uint256 => Card) monopolyField;
    mapping(uint256 => uint256[]) getMonopolyIndexes;
    
        // MONOPOLY FIELD DATA
    constructor() {
        createMonopoly([1, 2, 3]);
        createMonopoly([4, 5]);

        monopolyField[0] = Card({
            name: "",
            cardType: CardType.Start,
            price: 200, // user will get 200 when he stands on this card
            rentPrices: [uint16(0), 0, 0, 0, 0, 0]
        });
        monopolyField[1] = Card({
            name: "",
            cardType: CardType.Property,
            price: 300,
            rentPrices: [uint16(20), 50, 100, 300, 800, 1000]
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
    
    function createMonopoly(uint8[2] memory positions) internal {
        for(uint256 i = 0; i < positions.length; i++) {
            for(uint256 j = 0; j < positions.length; j++) {
                if(i != j) {    
                    getMonopolyIndexes[i].push(j);
                }
            }
        }
    }

    function createMonopoly(uint8[3] memory positions) internal {
        for(uint256 i = 0; i < positions.length; i++) {
            for(uint256 j = 0; j < positions.length; j++) {
                if(i != j) {    
                    getMonopolyIndexes[i].push(j);
                }
            }
        }
    }
    
    function createMonopoly(uint8[4] memory positions) internal {
        for(uint256 i = 0; i < positions.length; i++) {
            for(uint256 j = 0; j < positions.length; j++) {
                if(i != j) {    
                    getMonopolyIndexes[i].push(j);
                }
            }
        }
    }
}