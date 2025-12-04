// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Token metadata
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Mapping to track balances
    mapping(address => uint256) public balanceOf;

    // Nested mapping for allowances
    mapping(address => mapping(address => uint256)) public allowance;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor
    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    // Transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Validate recipient is not zero address
        require(_to != address(0), "Cannot transfer to zero address");
        
        // Validate sender has sufficient balance
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        
        // Transfer tokens
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        // Emit Transfer event
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }

    // Approve function
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // Validate spender is not zero address
        require(_spender != address(0), "Cannot approve zero address");
        
        // Set allowance
        allowance[msg.sender][_spender] = _value;
        
        // Emit Approval event
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }

    // TransferFrom function
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Validate recipient is not zero address
        require(_to != address(0), "Cannot transfer to zero address");
        
        // Validate sender has sufficient balance
        require(balanceOf[_from] >= _value, "Insufficient balance");
        
        // Validate caller has sufficient allowance
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
        
        // Transfer tokens
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        
        // Emit Transfer event
        emit Transfer(_from, _to, _value);
        
        return true;
    }
}
