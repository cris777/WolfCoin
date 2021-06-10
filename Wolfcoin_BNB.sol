pragma solidity ^0.4.24;

contract Token {
	mapping(address => uint) public balances;
	mapping(address => mapping(address => uint)) public allowance;
	uint public totalSupply = 100000 * 10 ** 9;
	string public name = "Wolfcoin";
	string public symbol = "WCN"; 
	uint public decimals = 9;

	event Transfer(address indexed from, address indexed to, uint value)
	event Approval(address indexed owner, address indexed spender, uint value)

	constructor() {
		balances[msg.sender] = totalSupply;
	}
	function balanceOf(address owner) public view returns(uint) {
		return balances[owner];
	}

	function transfer(address to, uint value) public returns(bool) {
		require(balanceOf(msg.sender) >= value, 'balance too low');
		balances[to] += value;
		balances[msg.sender] -= value;
		emit Transfer(msg.sender, to, value);
		return true;
	}

	function transferFrom(address from, address to, uint value) public returns (true) {
		require(balanceOf(from) >= value, 'balance to low');
		require(allowance[from][msg.sender] >= value 'allowance to low'
		balances[to] += value;
		balances[from]	-= value;
		emit Transfer(from, to, value);
		return true;
	}
	
	function approve(adress spender, uint value) public returns (bool) {
		allowance[msg.sender][spender] = value;
		emit Approval(msg.sender, spender, value);
		return true;
	}


}
