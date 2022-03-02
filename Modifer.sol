// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Modifer {

    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
        _;
    }

    function onlyCallByOwner() public onlyOwner view returns (bool) {
        if (msg.sender == owner) {
            return true;
        } else {
            return false;
        }
    }

    function adminOperation() public onlyOwner {
        // require(owner == msg.sender, "Not owner");
    }

    function withdraw() public onlyOwner {
        // require(owner == msg.sender, "Not owner");
    }
}