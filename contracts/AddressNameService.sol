// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./_Payment.sol";

contract AddressNameService is _Payment{
    event fundsDeposit(address indexed sender, address indexed recipient, uint amount);
    event fundsWithdraw(address indexed recipient, uint amount);

    mapping(string => address) public aliasToAddress;
    mapping(address => string[]) public addressToAliases; 
    mapping(address => uint256) private acountBalance;

    function initAccount(string memory _alias) public /* payable needsGwei(1000) */{
        aliasToAddress[_alias] = msg.sender;
        addressToAliases[msg.sender].push(_alias);
    }     

    function getOwner(string memory _alias) public view returns(address){
        return aliasToAddress[_alias];
    }

    function depositFunds(address _to, uint _amount) internal {      
      acountBalance[_to] += _amount;
      emit fundsDeposit(msg.sender, _to, _amount);
    }
    function getMyBalance() public view returns(uint256){
        return acountBalance[msg.sender];
    }
    function withdrawFunds(uint _amount) public {
      require(acountBalance[ msg.sender] >= _amount);
      acountBalance[ msg.sender] -= _amount;
      (bool sent,) =  msg.sender.call{value: _amount}("");
      require(sent, "Failed to withdraw Ether from balance");      
      emit fundsWithdraw(msg.sender, _amount);
    }

    function sendEthToAlias(string memory _alias) public payable needsGwei(5000){
        address _to = getOwner(_alias);
        depositFunds(_to, msg.value);
    }
}