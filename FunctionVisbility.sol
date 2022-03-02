// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// private, internal, external, public

contract FunctionVisibilty {
    uint value;
    function getValue() external view returns (uint) {
        return _getValuePrivate();
    }

    function setValue(uint _value) public {
        value = _value;
    }

    function _getValueInternal() internal view returns (uint) {
        return value;
    }
    function _getValuePrivate() private view returns (uint) {
        return value;
    }
}

contract SubFunctionVisibility is FunctionVisibilty {
    function getValueFromParent() public view returns (uint) {
        return _getValueInternal();
    }
}