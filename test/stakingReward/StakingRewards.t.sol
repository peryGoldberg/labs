// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
// Code is a stripped down version of Synthetix

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/stakingReward/StakingRewards.sol";
import "../../new-project/src/ERC20.sol";
pragma solidity ^0.8.20;
contract StakingRewardsTest is Test {
     StakingRewards public sr;
       MyToken public myToken;
       address user=vm.addr(11);
    function setUp() public {
       myToken = new MyToken();
       sr=new StakingRewards( address(myToken),address(myToken));
       myToken.mint(address(sr),1000000);
       myToken.mint(user,100);
    }
 
   //  function testTime() public {
   //     vm.startPrank(user); 
   //     uint amount=100000;
   //     myToken.approve(address(sr),amount);
   //     sr.stake(50);
   //     vm.warp(block.timestamp+ 2 days);
   //     sr.getReward();
   //     uint scale= 1000000;
   //     uint s=16;
   //     uint towDays=(172800*s)/scale;
   //     uint balance=address(user).balance;
   //     assertEq(balance,towDays,"not exsist");
   //     vm.stopPrank();
   //  }

}