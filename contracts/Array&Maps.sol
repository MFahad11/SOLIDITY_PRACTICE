// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MyContract{
    mapping(uint=>string) public names;
    mapping(uint=>Book) public books;
    mapping(address=>mapping(uint=>Book)) public myBooks;
    struct Book{
        string title;
        string author;
    }
    constructor(){
        names[1]="Adams";
        names[2]="Adam";
        names[3]="Adas";
    }
    function addBook(uint _id,string memory _title,string memory _author) public{
        // books[_id]=Book(_title,_author);
        myBooks[msg.sender][_id]=Book(_title,_author);
    }

}