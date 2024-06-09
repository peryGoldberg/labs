// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter{
    uint256 public counter;

    function get() public view returns(uint256){
        return counter;
    }
    function inc() public{
        counter+=1;
    }

    function dec()public{
        if(counter>0)
        counter-=1;
    }
}