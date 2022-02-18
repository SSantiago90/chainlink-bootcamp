// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/access/Ownable.sol";

contract JustANumber is Ownable {
    uint256 aNumber;
    mapping(address => uint256) addressToNumber;

    function setMainNumber(uint256 _number) public onlyOwner {
        aNumber = _number;
    }

    function setMyNumber(uint256 _number) public {
        addressToNumber[msg.sender] = _number;
    }

    function getMainNumber() public view returns (uint256) {
        return aNumber;
    }

    function getMyNumber() public view returns (uint256) {
        return addressToNumber[msg.sender];
    }

    function addMyNumber(uint256 _number) public {
        addressToNumber[msg.sender] = addressToNumber[msg.sender] + _number;
    }

    function setSum(uint256 _num1, uint256 _num2) public {
        addressToNumber[msg.sender] = _num1 + _num2;
    }

    function getMyNumMultiplied(uint256 _mult) public view returns (uint256) {
        return (addressToNumber[msg.sender] * _mult);
    }
}
