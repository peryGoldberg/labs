// / SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
pragma solidity ^0.8.20;
import "./IERC20.sol";

contract Staking{
 address public owner;
 IERC20 public immutable stakingToken; //finall
 IERC20 public immutable rewardsToken;
 uint public totalSupply; 
 //address=> The amount the user deposited
 mapping(address=>uint) public usersDeposit;
 //address=> The time the user depisited
 mapping(address=>uint) public usersTime;

  constructor(address _stakingToken, address _rewardToken) {
        owner = msg.sender;
        stakingToken = IERC20(_stakingToken);
        rewardsToken = IERC20(_rewardToken);
        totalSupply=1000000;
        stakingToken.transfer(address(this),totalSupply);
    }

//   modifier onlyOwner() {
//         require(msg.sender == owner, "not authorized");
//         _;
//     }

  modifier reward(address user){
       require(user!=address(0),"Address does not make sense");
       _;
  }  

//A function that deposits money
  function deposite(uint amount) external reward(msg.sender){
        require(amount>0,"The amount must be greater than 0");
        usersDeposit[msg.sender]+=amount;
        stakingToken.transfer(address(this), amount);
        usersTime[msg.sender]=block.timestamp;
  }

//A function that allows you to withdraw the money and rewards
  function withdraw(uint amount)  external reward(msg.sender){
    require(amount<=usersDeposit[msg.sender],"The amount is greater");
    require(block.timestamp > usersTime[msg.sender] + 1 weeks, "hasn't been a week");
    usersDeposit[msg.sender]-=amount;
    uint balanceSupply=stakingToken.balanceOf(address(this))-totalSupply;
    uint percentage = (amount * 100) /  balanceSupply;
    stakingToken.transferFrom(address(this),msg.sender,(totalSupply * percentage)/100+amount);
    
  }

//see the situation
  function getBalance() external view returns(uint){
    return stakingToken.balanceOf(address(this));
  }
  

}

