// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import './Monopoly.sol';

contract Jail {
    mapping(address => bool) public  isInJail;

    constructor() {

    }

    function putInJail(address player) internal  {
        isInJail[player] = true;
    }

    function freePlayer(address player) internal  {
        isInJail[player] = false;
    }
    
    function freePlayers(address[] calldata players) internal {
        for (uint256 i = 0; i < players.length; i++) {
            freePlayer(players[i]);
        }
    }

}