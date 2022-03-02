// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./CarFactory.sol";

contract CarFactory2 {
    Car[] public cars;

    function createWithMoney(string memory _model) public payable {
        require(msg.value >= 1 ether, "Not enough money");

        Car car = new Car{value: msg.value}(_model, address(this));
        cars.push(car);
    }
}

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
contract K is ERC20("K-Token-Name", "K-Token-Symbol") {
    function decimals() public pure override returns (uint8) {
        return 9;
    }
}