// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// https://ethereum.org/en/developers/docs/standards/tokens/erc-20/

interface IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract MyToken is IERC20 {
    string private __name;
    string private __symbol;
    uint8 private __decimals;
    uint256 private __totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) {
        __name = _name;
        __symbol = _symbol;
        __decimals = _decimals;
        __totalSupply = _totalSupply;

        balances[msg.sender] = __totalSupply;
    }

    function name() public override view returns (string memory) {
        return __name;
    }

    function symbol() public override view returns (string memory) {
        return __symbol;
    }

    function decimals() public override view returns (uint8) {
        return __decimals;
    }

    function totalSupply() public override view returns (uint256) {
        return __totalSupply;
    }

    function balanceOf(address _owner) public override view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public override returns (bool success) {
        require(balances[msg.sender] >= _value, "Not enough value!");

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success) {
        uint allowanceValue = allowances[_from][msg.sender];
        uint leftAllowance = allowanceValue - _value;
        require(leftAllowance >= 0, "Not enough allowance!");

        allowances[_from][msg.sender] = leftAllowance;

        require(balances[_from] >= _value, "Not enough balance!");
        balances[_from] -= _value;
        balances[_to] += _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public override returns (bool success) {
        allowances[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) public override view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }
}
