// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./Storage.sol"; 

contract StorageFactory {
    
    Storage[] public StorageArray;          //create array (type) Storage. 
    function createStorageContract() public {
        Storage Storage = new Storage();   //create Storage type object namely Storage
                                                            //then new Storage() contracts without any inputs()??????????????? 
                                                                                                                //which inputs should we write????

        StorageArray.push(Storage); //When createStorageContract runs it is added to the array
    
    }
    // } here we can deploy Storage.sol contract from this StoraceFactory.sol contract.



//call store and retrieve functions in the Storage.sol from StorageFactory.sol
    function sfStore(uint256 _StorageIndex, uint256 _StorageNumber) public {

        //_StorageIndex allows to choose which Storage[] contract in the created list that we wanna interact with
        //_StorageNumber to call on the store function in the Storage.sol


        //this line has an explicit cast to the address type and initializes a new Storage object from the address
        Storage(address(StorageArray[_StorageIndex])).store(_StorageNumber); 

        //this line simply gets the Storage object at the index _StorageIndex in the array StorageArray
        //StorageArray[_StorageIndex].store(_StorageNumber);
    }
    
    function sfGet(uint256 _StorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a new Storage object from the address 
        return Storage(address(StorageArray[_StorageIndex])).retrieve(); 

        //this line simply gets the Storage object at the index _StorageIndex in the array StorageArray
        //return StorageArray[_StorageIndex].retrieve(); 
    }
}

