// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract PayDemo {

    // 存储用户转入合约的余额
    mapping (address => uint) public balances;

    // 获取某个用户的余额
    function getMyBalance(address myAddress) public view returns (uint) {
        return myAddress.balance;
    }

    // 获取合约的余额
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // 用户转账到合约
    function pay() public payable {
        address addr = msg.sender;
        balances[addr] = msg.value;
    }
    
}