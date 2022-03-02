// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Event {
    event Log(address sender, string message);

    function transfer() public {
        // xxxxxx
        emit Log(msg.sender, "I send 1 ehter to you!");
        emit Log(msg.sender, "I send 2 ehter to you!");
        emit Log(msg.sender, "I send 3 ehter to you!");
    }
 }