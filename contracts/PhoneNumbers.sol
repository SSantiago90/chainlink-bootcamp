// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./AddressNameService.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PhoneNumbers is AddressNameService, Ownable {
    event PhoneNumberAdded(address indexed owner, uint64 phoneNumber);

    mapping(address => uint64) addressToPhone;

    //function getOwner(string memory _alias) public view returns(address)       
    function addPhoneNumber(string memory _alias, uint64 _phoneNumber) public {
        address userAddress =  getOwner(_alias);
        addressToPhone[userAddress] = _phoneNumber;
        emit PhoneNumberAdded(userAddress, _phoneNumber);        
    }

    function getPhoneNumber(string memory _alias) public view returns (uint64){
        address userAddress =  getOwner(_alias);
        return (addressToPhone[userAddress]);
    }

    function changeUserNumber(uint64 _number) public onlyOwner {
        addressToPhone[msg.sender] = _number;
    }
}