// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Wallet {
    address  public owner;
    address public user1;
    address public user2;
    address public user3;
   

    constructor() {
        owner = payable(msg.sender);
        user1= 0x1234567890123456789012345678901234567890;
        user2= 0x9876543210987654321098765432109876543210;
        user3= 0x9876543210987654324554541312109876543210;
    }

    receive() external payable {}

    function withdraw(uint256 wad) external {

        require(user1==msg.sender || user2==msg.sender || user3==msg.sender, "WALLET-not-owner");
        payable(msg.sender).transfer(wad);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function change(address newUser,address oldUser) external {
        require(owner==msg.sender,"you are not the owner");
        if(user1==oldUser){  
            user1=newUser;
            return;
        }
         if(user2==oldUser){
              user2=newUser;
              return;
         }
          
        else if(user3==oldUser){
             user3=newUser;
        }
           
    }
   

}