//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
 import "@hack/Auction/Auction.sol";
 import "../../newProject/src/ERC20.sol";
 import "../../newProject/src/ERC721.sol";
 import "@hack/MyToken/MyToken.sol";
 pragma solidity ^0.8.20;

contract AuctionTest is Test {
    Auction public a;
    MyERC20 public tokenA;
    NFTtoken public nftToken;
    function setUp() public {
         tokenA= new MyERC20("tokenA",'AAA');
         nftToken= new NFTtoken();  
         a = new Auction(40,address(tokenA),address(nftToken));
    }

    function testProposal() public{
        address user=vm.addr(1);
        vm.startPrank(user);
        tokenA.mint(address(user),80);
        tokenA.approve(address(a),80);
        a.Proposal(80);                    
        address w=a.winner();
           assertEq(w,user,"error not winner");
           assertEq(tokenA.balanceOf(address(user)),0,"error not mach money");
           assertEq(a.bidders(user),80,"not good");
        vm.stopPrank();
    }


    function testCancelation() public{
        address user1=vm.addr(1);
        address user2=vm.addr(2);
        vm.startPrank(user1);
        tokenA.mint(address(user1),100);
        tokenA.approve(address(a),100);
        a.Proposal(100);
        vm.stopPrank();

        vm.startPrank(user2);
        tokenA.mint(address(user2),130);
        tokenA.approve(address(a),130);
        a.Proposal(130);
        vm.stopPrank();

        vm.startPrank(user1);
        tokenA.approve(user1,100);
        a.cancelation();
        assertEq(tokenA.balanceOf(address(user1)),100,"error not mach money");
        assertEq(tokenA.balanceOf(address(a)),130,"error not mach money");
        vm.stopPrank();
    }

        function testWinnerCantCancel() public{
        address user = vm.addr(1);
        vm.startPrank(user);
        console.log(tokenA.balanceOf(user));
        tokenA.mint(address(user), 120);
        tokenA.approve(address(a), 120);
        a.Proposal(120);
        vm.expectRevert();
        a.cancelation();
        vm.stopPrank();
    }

    function testOverTime() public{
         address user=vm.addr(1);
        vm.startPrank(user);
        tokenA.mint(address(user),80);
        tokenA.approve(address(a),80);
        vm.warp(block.timestamp+ 9 days);
        vm.expectRevert();
        a.Proposal(80);                    
        vm.stopPrank();
    }

    function testFinish() public{
       address user1=vm.addr(1);
        address user2=vm.addr(2);
        vm.startPrank(user1);
        tokenA.mint(address(user1),100);
        tokenA.approve(address(a),100);
        a.Proposal(100);
        vm.stopPrank();

        vm.startPrank(user2);
        tokenA.mint(address(user2),130);
        tokenA.approve(address(a),130);
        a.Proposal(130);
        vm.stopPrank();

        vm.startPrank(user1);
        vm.warp(block.timestamp+ 9 days);
        nftToken.approve(address(this),5);
        a.cancelation();
        assertEq(nftToken.balanceOf(user2),1,"error");
                          
        vm.stopPrank();
    }
}