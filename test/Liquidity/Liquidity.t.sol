//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
 import "@hack/Liquidity/Liquidity.sol";
 import "../../new-project/src/ERC20.sol";
 import "@hack/MyToken/MyToken.sol";
 pragma solidity ^0.8.20;

contract LiquidityTest is Test {
    Liquidity public l;
    MyERC20 public tokenA;
    MyERC20 public tokenB;
    function setUp() public {
         tokenA= new MyERC20("tokenA",'AAA');
         tokenB= new MyERC20("tokenB",'BBB');  
        l = new Liquidity(address(tokenA),address(tokenB),100,100);
    }


    function testTradeAToB() public{
       
        uint amount = 50;
        address user=vm.addr(11);
        vm.startPrank(user);
         tokenA.mint(address(this),amount);
        tokenA.approve(address(l),amount);
         tokenA.transfer(address(user),amount); 
        l.tradeAToB(20);
        uint add=address(user).balance*10**18;
        uint mnt=16.666666667*10**18;
        assertEq(add,mnt,"neeed");
        vm.stopPrank();
    }

}