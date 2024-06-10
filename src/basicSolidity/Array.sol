// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract array{
uint[] public arr;
uint public arr2=[1,2,3];
uint[10] public fix;

function get(uint i) public view returns(uint){
    return arr[i];
}

function getArr() public view returns(uint [] arr){
    return arr;
}

function push() public{
    arr.push(4);
}
function pop() public{
    arr.pop();
}

function removeA(uint i) public{
    delete arr[i];
}

function getLen() public view returns(uint){
    return arr.length;

}

function example() public{
    uint[] public memory=new uint[](5);
}

function remove(uint index) public{
  require(index<arr.length,"error");
  for(uint i=index;i<arr.length;i++){
    arr[i]=arr[i+1];
  }
  arr.pop();
}

function delete(uint[] arr) public{
    remove(2);
    assert(arr[0]==1);
    assert(arr[1]==2);
    assert(arr[2]==4);
    assert(arr[3]==5);
    assert(arr.length==4);
    arr=[1];
    remove(0);
}

enum Status{
    Cancel,
    Delete,
    Add
}

Status public s;
function get() public view returns(Status){
return s;
}
function set(Status status) public{
s=status;
}
function cancel() public{
    s=Status.Cancel;
}
function reset() public{
    delete s;
}
}