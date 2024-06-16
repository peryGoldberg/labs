  // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract simple{

   mapping(address=> uint256) balance;
   mapping(address=>mapping(uint=>bool)) map;

   function get(address addr) public view returns(uint){
      return balance[addr];
   }
   function set(address addr,uint256 i) public {
      balance[addr]=i;
   }
   function deleted(address addr) public{
      delete balance[addr];
   }

    function getMap(address addr,uint _i) public view returns(uint){
      return balance[addr][_i];
   }
   function setMap(address addr,uint256 i,uint _i) public {
      balance[addr]_i=i;
   }
   function deleteMap(address addr,uint _i) public{
      delete balance[addr][_i];
   }
   uint public num;
   uint256 public i=1;

   uint256 public one=1 wei;
   bool public b=(one==1);

   uint256 public tow=1 gwei;
   bool public c=(tow==1e9);


 uint256 public tow=1 ether;
   bool public c=(tow==1e18);

   function get() public view returns(uint){
    return num;
   }

   function set(uint n) public{
        num=n;
   }
 function forever() public{
    while(true){
        i+=1;
    }
 }

 function xBig(uint x) public pure returns(uint){
    if(x<10)
        return 0;
    if(x<20)
        return 1;
     return 2;    
 }

 function short(uint256 x) public pure returns(uint){
    return x>10? 1:2;
 }

 function loop() public {
    for(uint256 i =0 ; i<10 ;i++){
        if(i==3)
        continue;
        if(i==5)
        break;
    }

    uint j=0;
    while(j<10){
      j++;
    }
 }

}