// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ConfigDemo {

    string _name = "Hello Demo";
    bool _isOpen = true;
    address _myOwnder;

    /*
        设置创建合约的人为owner，它能够拥有权限进行合同启用和停用操作
    */
    constructor() {
        _myOwnder = msg.sender;
    }

    // 读取合约当前的设置, 如果合约未启用则出错
    function getName() public view returns (string memory) {
        require(_isOpen, "Contract must be open");
        return _name;
    }

    // 设置新的合约名称, 如果合约未启用则出错
    function setName(string memory newName) public {
        require(_isOpen, "Contract must be open");
        _name = newName;
    }

    // 设置合约是否启用或停用，只有合约ownder才能设置
    function setStatus(bool newName) public {
        require(_myOwnder == msg.sender, "Only owner can do it");
        _isOpen = newName;
    }

}
