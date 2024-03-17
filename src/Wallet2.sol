// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Wallet2 {
    address  public owner;
    address[] public owners =[
        0x1234567890123456789012345678901234567890,
        0x9876543210987654321098765432109876543210,
        0x9876543210987654324554541312109876543210
    ];
    mapping(address => uint256) public balances;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function receiveit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 wad) external {
        bool isOwner = false;
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == msg.sender) {
                isOwner = true;
            }
        }
        require(owner == msg.sender||isOwner, "WALLET-not-owner");
        payable(msg.sender).transfer(wad);
        balances[msg.sender] -= wad;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function addOwner(address newOwner) external {
        owners.push(newOwner);
    }
}
