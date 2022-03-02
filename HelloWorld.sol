// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract HelloWorld {
    string message = "Hello World";

    constructor() {

    }

    function setMessage(string memory _message) public { // memory, storage
        message = _message;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}