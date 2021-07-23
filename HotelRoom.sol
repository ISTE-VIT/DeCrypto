//SPDX-License-Identifier:MIT

pragma solidity ^0.6.4;

contract Hotel{
    
    enum Status{ vacant, occupied }
    Status CurrentStatus;
    
    event Booking(address customer , uint amountPaid);
    
    address payable public owner;
    
    
    
    constructor() public{
        owner = msg.sender;
        CurrentStatus = Status.vacant;
    }
    
    
    function book() payable public {
        
        require(CurrentStatus == Status.vacant , "The room is currently occupied");
        
        require(msg.value >= 3 ether , "Not enough ethers");
        
        owner.send(msg.value);
        
        CurrentStatus = Status.occupied;
        
        emit Booking(msg.sender , msg.value);
    }
}


