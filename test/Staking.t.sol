// //SPDX-License-Identifier: MIT
// // https://solidity-by-example.org/defi/staking-rewards/
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "forge-std/Test.sol";
// import "forge-std/console.sol";
//  import "@hack/Staking.sol";
//  import "../../new-project/src/ERC20.sol";
 pragma solidity ^0.8.20;

// contract StakingTest is Test {
//     Staking public s;
//      MyToken public myToken;

//     function setUp() public { 
//         myToken = new MyToken();
//         s = new Staking(address(myToken));
//     }




//     // function testDeposit() external{
      
//     //     uint256 balanceBefore = address(s).balance; 
//     //     uint amount = 50;
//     //     uint numOfBefore = s.numOfDeposit(msg.sender);
//     //     uint initialBalance = s.getBalance();
//     //     myToken.mint(address(this),amount);
//     //     myToken.approve(address(s),amount);
//     //     s.deposite(amount);
//     //     uint256 balanceAfter = address(s).balance;
//     //     uint numOfAfter = s.numOfDeposit(msg.sender);
//     //     assertEq(  balanceAfter - balanceBefore,  50, "expect increase of 50 ether");
//     //     assertEq(numOfAfter - numOfBefore, 1, "aaaaa");
//     //     assertEq(s.getBalance() - initialBalance, amount,"a error!!!!");
//     // }

//     function testDeposit() public{
//         uint initialBalance = s.getBalance();
//         uint amount = 120;
//         myToken.mint(address(this),amount);
//         myToken.approve(address(s),amount);
//         s.deposite(amount);
//         assertEq(s.getBalance() - initialBalance, amount);
//     }


//     function testWithdraw() external {
//      uint amount=50;
//       myToken.mint(address(this),amount);
//       myToken.approve(address(s),amount);
//       s.deposite(amount);
//       vm.warp(block.timestamp+ 8 days);
//       assertEq(s.getBalance(),50,"you have worng");
//       s.
    // function tesTtradeAToB(uint amountA) external{withdraw(amount);
//       assertEq(s.getBalance(),0,"you cant withdraw");
//     }

// }