// //SPDX-License-Identifier: MIT
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "forge-std/Test.sol";
// import "forge-std/console.sol";
//  import "@hack/staking/Staking.sol";
//  import "../../newProject/src/ERC20.sol";
// pragma solidity ^0.8.20;

// contract StakingTest is Test {
//     Staking public s;
//      MyToken public myToken;

//     function setUp() public { 
//         myToken = new MyToken();
//         s = new Staking(address(myToken));
//     }



//     function testDeposit() external{
      
//         uint256 balanceBefore = address(s).balance; 
//         uint amount = 50;
//         uint numOfBefore = s.numOfDeposit(msg.sender);
//         uint initialBalance = s.getBalance();
//         myToken.mint(address(this),amount);
//         myToken.approve(address(s),amount);
//         s.deposite(amount);
//         uint256 balanceAfter = address(s).balance;
//         uint numOfAfter = s.numOfDeposit(msg.sender);
//         assertEq(  balanceAfter - balanceBefore,  50, "expect increase of 50 ether");
//         assertEq(numOfAfter - numOfBefore, 1, "an error!");
//         assertEq(s.getBalance() - initialBalance, amount,"an error!!!!");
//     }

   

//     function testWithdraw() external {
//      uint amount=50;
//       myToken.mint(address(this),amount);
//       myToken.approve(address(s),amount);
//       s.deposite(amount);
//       vm.warp(block.timestamp+ 8 days);
//       assertEq(s.getBalance(),50,"you have worng");
//     }
//     // function tesTtradeAToB(uint amountA) external{
//     //   withdraw(amountA);
//     //   assertEq(s.getBalance(),0,"you cant withdraw");
//     // }

// }
