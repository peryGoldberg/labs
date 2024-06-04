
// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../new-project/src/ERC20.sol";
 pragma solidity ^0.8.20;
struct userDeposit{
  uint time;
  uint amount;
}
contract Staking{
 address public owner;
 MyToken public immutable myToken ;
 uint public totalSupply;
 //address=> time=>amount the user depisited
 mapping(address=>mapping(uint=>userDeposit)) public deposit;
 mapping(address=>uint) public numOfDeposit;

  constructor(address token) {
        owner = msg.sender;
        myToken = MyToken(token);
        totalSupply=1000000;
        myToken.mint(address(this),totalSupply);
  }
 
  modifier reward(address user){
       require(user!=address(0),"Address does not make sense");
       _;
  }
//A function that deposits money
  function deposite(uint amount) external reward(msg.sender){
        require(amount>0,"The amount must be greater than 0");
        deposit[msg.sender][block.timestamp]=amount;
        myToken.transfer(address(this), amount);
        numOfDeposit[msg.sender]+=1;
  }

  function withdraw(uint amount)  external reward(msg.sender){
    require(amount>0,"The amount must be greater than 0");

    for (uint i = 0; i < numOfDeposit[msg.sender]&&amount!=0; i++) {
       uint time = deposit[msg.sender][i];
        // Check if the timestamp is valid (not 0) and if it's been more than a week
        
        require(block.timestamp > time + 1 weeks,"Time has not passed");
    
            uint depositedAmount = deposit[msg.sender][time];
            if (amount <= depositedAmount) {
                deposit[msg.sender][time] -= amount;
               amount=0;
            } 
            else {
                deposit[msg.sender][time] = 0;
                amount -= depositedAmount;
            }
        
        
    }
    require(amount,0,"you cant withdraw this amount");
    uint balanceSupply=myToken.balanceOf(address(this))-totalSupply;
    uint percentage = (amount * 100) /  balanceSupply;
    myToken.transferFrom(address(this),msg.sender,(totalSupply * percentage)/100);
    
  }
  function getBalance() external view returns(uint){
    return myToken.balanceOf(address(this));
  }
}





