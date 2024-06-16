// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract toDo{
struct todo{
    string  text;
    bool  complete;
}

todo[] public Todo;

function create(string calldata _text) public{
Todo.push(Todo(_text,false));
Todo.push(Todo({text:_text,complete:false}));

todo memory t;
t.text=_text;
Todo.push(t);

}

function get(uint _index) public view returns(string text, bool complete){
   todo  storage t= Todo[_index];
   return(t.text,t.complete);
}

function appdateText(uint _index,string _text) public{
    Todo[_index].text=_text;
}

function appdateComplete(uint _index) public{
    Todo[_index].complete=!Todo[_index].complete;
}
}