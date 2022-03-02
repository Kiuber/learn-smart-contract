// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// require
// assert
// revert

contract Error {
    int public balance;

    function deposit1(int _amount) public {
        require(_amount > 0, "Deposited amount must be greater than zero");
        balance += _amount;
    }

    function deposit2(int _amount) public {
        int oldBalance = balance;
        balance += _amount;
        assert(balance >= oldBalance);
    }

    function deposit3(int _amount) public {
        int oldBalance = balance;
        balance += _amount;

        if (balance < oldBalance) {
            revert("Impossible!");
        }
    }
}