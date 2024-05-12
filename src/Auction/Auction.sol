// SPDX-License-Identifier: MIT
// https://medium.com/@marketing.blockchain/how-to-create-a-multisig-wallet-in-solidity-cfb759dbdb35
pragma solidity ^0.8.20;
import "forge-std/console.sol";
import "../../newProject/src/ERC20.sol";
import "../../newProject/src/ERC721.sol";
contract Auction {
   bool public flagFinish;
    address public owner;
     MyToken public immutable myToken;
     NFTtoken public immutable nft;
     uint public finishTime;
     mapping(address=>uint) public bidders;
     address [] public addresses;
     address public winner;
  constructor(uint sum,address token,address n){
    myToken = MyToken(token);
    nft = NFTtoken(n);
    owner = msg.sender;
    nft.mint(owner,5);
    bidders[msg.sender]=sum;
    winner = msg.sender;
    finishTime=block.timestamp + 7 days;
    flagFinish=false;
  }

  
  function Proposal(uint amount) external{  
    require(amount>bidders[winner],"not enough money");
    if(block.timestamp<finishTime){
        bidders[msg.sender]=amount;
        addresses.push(msg.sender);
        myToken.transferFrom(msg.sender,address(this),amount);
        winner=msg.sender;
    }
    else if(!flagFinish){
       flagFinish=true;
       finish();
    } 
   
  }

  function cancelation() external{
    require(winner!=msg.sender,"the winner cant cancel");
     if(block.timestamp<finishTime){
         myToken.transfer(msg.sender,bidders[msg.sender]);
         bidders[msg.sender]=0;
    }
    else if(!flagFinish){
       flagFinish=true;
       finish();
    } 
  }

  function finish() internal{
    require(winner!=owner,"you cant");
   
    for(uint i=0;i<addresses.length;i++){
        if(bidders[addresses[i]]>0&&addresses[i]!=winner)
            myToken.transfer(addresses[i],bidders[addresses[i]]);
    }
    nft.transferFrom(owner,winner,5);


  }

  function getCurrentWinner() external view returns(uint){
    return bidders[winner];
  }

   
 

}






    
