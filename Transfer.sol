//SPDX-License-Identifier:MIT;

pragma solidity ^0.8.4;

contract Transact{
    uint amount;
    
    function Pay() public payable {
        amount = msg.value;
    }
    
    function GetAmount() public view returns(uint){
        return amount;
    }
    
    function GetBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function Recieve(address payable account1) public {
        account1.transfer(2 ether);
    }
}