//זה הנכון
// // SPDX-License-Identifier: MIT
// // https://solidity-by-example.org/defi/staking-rewards/
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "../new-project/src/ERC20.sol";
 pragma solidity ^0.8.20;
// struct userDeposit{
//   uint time;
//   uint amount;
// }
// contract Staking{
//  address public owner;
//  MyToken public immutable myToken ;
//  uint public totalSupply;
//  //address=> time=>amount the user depisited
//  mapping(address=>mapping(uint=>userDeposit)) public deposit;
//  mapping(address=>uint) public numOfDeposit;

//   constructor(address token) {
//         owner = msg.sender;
//         myToken = MyToken(token);
//         totalSupply=1000000;
//         myToken.mint(address(this),totalSupply);
//   }
 
//   modifier reward(address user){
//        require(user!=address(0),"Address does not make sense");
//        _;
//   }
// //A function that deposits money
//   function deposite(uint amount) external reward(msg.sender){
//         require(amount>0,"The amount must be greater than 0");
//         deposit[msg.sender][block.timestamp]=amount;
//         myToken.transfer(address(this), amount);
//         numOfDeposit[msg.sender]+=1;
//   }

//   function withdraw(uint amount)  external reward(msg.sender){
//     require(amount>0,"The amount must be greater than 0");

//     for (uint i = 0; i < numOfDeposit[msg.sender]&&amount!=0; i++) {
//        uint time = deposit[msg.sender][i];
//         // Check if the timestamp is valid (not 0) and if it's been more than a week
        
//         require(block.timestamp > time + 1 weeks,"Time has not passed");
    
//             uint depositedAmount = deposit[msg.sender][time];
//             if (amount <= depositedAmount) {
//                 deposit[msg.sender][time] -= amount;
//                amount=0;
//             } 
//             else {
//                 deposit[msg.sender][time] = 0;
//                 amount -= depositedAmount;
//             }
        
        
//     }
//     require(amount,0,"you cant withdraw this amount");
//     uint balanceSupply=myToken.balanceOf(address(this))-totalSupply;
//     uint percentage = (amount * 100) /  balanceSupply;
//     myToken.transferFrom(address(this),msg.sender,(totalSupply * percentage)/100);
    
//   }
//   function getBalance() external view returns(uint){
//     return myToken.balanceOf(address(this));
//   }
// }


//A function that allows you to withdraw the money and rewards
  
//  function withdraw(uint amount) external reward(msg.sender){
//     require(amount > 0, "The amount must be greater than 0");
//     require(block.timestamp > deposit[msg.sender][block.timestamp] + 1 weeks, "Hasn't been a week since deposit");
//     uint totalWithdrawn;
//     uint balanceSupply = stakingToken.balanceOf(address(this)) - totalSupply;

//     // Loop over all timestamps in deposit[msg.sender]
//     for (uint i = 0; i < deposit[msg.sender].length; i++) {
//         uint timestamp = deposit[msg.sender][i];

//         // Check if the timestamp is valid (not 0) and if it's been more than a week
//         if (timestamp != 0 && block.timestamp > timestamp + 1 weeks) {
//             uint depositedAmount = deposit[msg.sender][timestamp];
//             if (amount <= depositedAmount) {
//                 deposit[msg.sender][timestamp] -= amount;
//                 totalWithdrawn += amount;
//                 break; // Exit the loop if the full amount has been withdrawn
//             } else {
//                 deposit[msg.sender][timestamp] = 0;
//                 totalWithdrawn += depositedAmount;
//                 amount -= depositedAmount;
//             }
//         }
//     }

//     require(totalWithdrawn > 0, "No valid deposits found");
//     uint rewardAmount = (totalSupply * totalWithdrawn * 100) / (balanceSupply * 100);
//     uint totalAmount = totalWithdrawn + rewardAmount;

//     stakingToken.transfer(msg.sender, totalAmount);
// }

//see the situation

// // https://solidity-by-example.org/defi/staking-rewards/
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// pragma solidity ^0.8.20;
// // import "./IERC20.sol";

// contract Staking{
//  address public owner;
//  IERC20 public immutable stakingToken; //finall
//  uint public totalSupply; 
//  //address=> The amount the user deposited
//  mapping(address=>uint) public usersDeposit;
//  //address=> The time the user depisited
//  mapping(address=>uint) public usersTime;

//   constructor() {
//         owner = msg.sender;
//         stakingToken = IERC20(0x127fea9Dd797E70B2BF3AdBDda7a9F324332b01f);
//         totalSupply=1000000;
//         stakingToken.transfer(address(this),totalSupply);
//     }

//   modifier onlyOwner() {
//         require(msg.sender == owner, "not authorized");
//         _;
//     }

//   modifier reward(address user){
//        require(user!=address(0),"Address does not make sense");
//        _;
//   }  

// //A function that deposits money
//   function deposite(uint amount) external reward(msg.sender){
//         require(amount>0,"The amount must be greater than 0");
//         usersDeposit[msg.sender]+=amount;
//         stakingToken.transfer(address(this), amount);
//         usersTime[msg.sender]=block.timestamp;
//   }




// //see the situation
//   function getBalance() external view returns(uint){
//     return stakingToken.balanceOf(address(this));
//   }
  

// }

  // function withdraw(uint amount)  external reward(msg.sender){
  //   require(amount<=usersDeposit[msg.sender],"The amount is greater");
  //   require(block.timestamp > usersTime[msg.sender] + 1 weeks, "hasn't been a week");
  //   usersDeposit[msg.sender]-=amount;
  //   uint balanceSupply=stakingToken.balanceOf(address(this))-totalSupply;
  //   uint percentage = (amount * 100) /  balanceSupply;
  //   stakingToken.transferFrom(address(this),msg.sender,(totalSupply * percentage)/100+amount);
    
  // }

// //A function that allows you to withdraw the money and rewards
// function withdraw(uint amount) external reward(msg.sender){
//     require(amount > 0, "The amount must be greater than 0");
//     require(block.timestamp > deposit[msg.sender][block.timestamp] + 1 weeks, "Hasn't been a week since deposit");

//     uint totalWithdrawn;
//     uint balanceSupply = stakingToken.balanceOf(address(this)) - totalSupply;

//     // Loop over all timestamps in deposit[msg.sender]
//     for (uint i = 0; i < deposit[msg.sender].length; i++) {
//         uint timestamp = deposit[msg.sender][i];

//         // Check if the timestamp is valid (not 0) and if it's been more than a week
//         if (timestamp != 0 && block.timestamp > timestamp + 1 weeks) {
//             uint depositedAmount = deposit[msg.sender][timestamp];
//             if (amount <= depositedAmount) {
//                 deposit[msg.sender][timestamp] -= amount;
//                 totalWithdrawn += amount;
//                 break; // Exit the loop if the full amount has been withdrawn
//             } else {
//                 deposit[msg.sender][timestamp] = 0;
//                 totalWithdrawn += depositedAmount;
//                 amount -= depositedAmount;
//             }
//         }
//     }

//     require(totalWithdrawn > 0, "No valid deposits found");
//     uint rewardAmount = (totalSupply * totalWithdrawn * 100) / (balanceSupply * 100);
//     uint totalAmount = totalWithdrawn + rewardAmount;

//     stakingToken.transfer(msg.sender, totalAmount);
//  }