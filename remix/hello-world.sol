// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string name = "Hello, World!";
    function getName() public view returns (string memory) {
        return name;
    }
}