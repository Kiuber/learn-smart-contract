// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint result = x + y;
        require(result > x, "Overflow!");

        return result;
    }
}

contract TestSafeMath {
    using SafeMath for uint;
}
