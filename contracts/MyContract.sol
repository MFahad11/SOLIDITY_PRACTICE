// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyContract{
    uint myUint=1;
    struct MyStruct{
       uint numb;
       string str; 
    }
    MyStruct public myStruct=MyStruct(1,"Fahad");
    function getValue() public pure returns (uint){
        uint value=1;
        return value;
    }
}