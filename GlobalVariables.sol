// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GlobalVariables {

    event LOG(address, uint);

    function getGasInfo() public view returns (uint, uint) {
        return (tx.gasprice, block.gaslimit);
    }

    // // test
    // function getTest() public pure returns (string memory) {
    //     return "test";
    // }

    function getBlockInfo() public view returns (uint, address, uint, uint, uint, uint) {
        return (block.chainid,
                block.coinbase,
                block.difficulty,
                block.gaslimit,
                block.number,
                block.timestamp);
    }

    // function getMessageInfo() public payable returns (address, uint) {
    //     return (msg.sender, msg.value);
    // }

    function getMessageInfo() public payable {
        emit LOG(msg.sender, msg.value);
    }
}