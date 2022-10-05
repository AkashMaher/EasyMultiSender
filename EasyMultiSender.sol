//SPDX-License-Identifier: MIT
pragma solidity <= 0.8.7;

contract EasyMultiSender{

//split equal amount
 function EqualSplitter(address[] calldata _toAddress) public payable{
     uint256 balance = msg.value;
     require (balance>0,"amount must be more than 0 to split");
     uint256 splitter = balance/_toAddress.length;
     for(uint i = 0; i<_toAddress.length; i++){
         (bool sent, ) = _toAddress[i].call{ value: splitter}("tnx");
         balance = balance-splitter;
         require (sent == true,"tnx failed");
     }
 }
}
