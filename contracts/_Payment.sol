// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract _Payment {
    function gweiToWei(uint256 gweiAmount) public pure returns (uint256 weiAmount) {
        return gweiAmount * 1e9;
    }
    function ethToWei(uint256 ethAmount) public pure returns (uint256 weiAmount) {
        return ethAmount * 1e18;
    }
    
    modifier needsWei(uint _amount) {
        require(msg.value >= _amount, "Insufficient ETH sent for this transaction");
        _;
    }
    modifier needsGwei(uint _amount) {
        uint256 weiToPay = gweiToWei(_amount);
        require(msg.value >= weiToPay, "Insufficient ETH sent for this transaction");
        _;
    }
    modifier needsEth(uint _amount) {
        uint256 weiToPay = ethToWei(_amount);
        require(msg.value >= weiToPay, "Insufficient ETH sent for this transaction");
        _;
    }
}
