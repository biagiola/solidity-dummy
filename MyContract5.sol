pragma solidity ^0.5.1;

contract MyContract {
    uint256 public peopleCount;
    mapping(uint => Person) public people2;
    
    address public owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function addPerson(
        string memory _firstName, 
        string memory _lastName
    ) 
        public 
        onlyOwner
    {
        people2[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
        incrementCount();
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
    
}
