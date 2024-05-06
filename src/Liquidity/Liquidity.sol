// SPDX-License-Identifier: GPL-3.0
 import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity ^0.8.20;

contract Liquidity {
uint public total;
IERC20 public immutable tokenA ;
IERC20 public immutable tokenB ;
uint public balanceA;
uint public balanceB;
address public owner;
mapping(address=>uint)public addUsers;

constructor(address a ,address b ,uint countA,uint countB){
    owner=msg.sender;
    tokenA = IERC20(a);
    tokenB = IERC20(b);
   balanceA=countA;
   balanceB=countB;
   total=balanceA*balanceB;
  tokenA.transfer(address(this),balanceA);
  tokenB.transfer(address(this),balanceB);   
}
function price() public view returns(uint){
    return total;
}

function tradeAToB(uint amountA) external{
 require(balanceB>0,"you cant change");
 require(amountA>0,"you cant change"); 
 uint initialB=balanceB;  
balanceA+=amountA;
balanceB=total/balanceA;
tokenB.transferFrom(address(this),msg.sender,initialB-balanceB);
tokenA.transferFrom(msg.sender,address(this),amountA);

}

function tradeBToA(uint amountB) external{
 require(balanceA>0,"you cant change");
 require(amountB>0,"you cant change"); 
uint initialA=balanceA;  
balanceB+=amountB;
balanceA=total/balanceB;
tokenA.transferFrom(address(this),msg.sender,initialA-balanceA);
tokenB.transferFrom(msg.sender,address(this),amountB);

}

function addLiquidity(uint amount) external {
    require(amount>0,"it need be greater than 0");
    uint calc=amount/(balanceA+balanceB);
    uint countA=calc*balanceA;
    uint countB=calc*balanceB;
    tokenA.transfer(address(this),countA);
    tokenB.transfer(address(this),countB);
    balanceA+=countA;
    balanceB+=countB;
    addUsers[msg.sender]+=amount;
}

function removeLiquidity(uint amount) external {
    require(amount>0,"the amount need be greater than 0");
    require(addUsers[msg.sender]>=amount,"you not have enough tokens in the pool");
    uint calc=amount/(balanceA+balanceB);
    uint countA=calc*balanceA;
    uint countB=calc*balanceB;
    require(tokenA.balanceOf(msg.sender)>=countB&&tokenB.balanceOf(msg.sender)>=countB,"you have not enough tokens");
    tokenA.transferFrom(address(this),msg.sender,countA);
    tokenB.transferFrom(address(this),msg.sender,countB);
    balanceA-=countA;
    balanceB-=countB;
    addUsers[msg.sender]-=amount; 
}

}