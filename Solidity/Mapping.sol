// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract profileBook {
    struct Profile {
        string name;
        uint256 age;
        bool isEmployed;
    }

    // structure of mapping
    // mapping(KeyType => ValueType) public myMapping;
    // map from an address to a profile

    mapping(address => Profile) public profiles;

    // store profile for the caller
    function setProfile(
        string memory _name,
        uint256 _age,
        bool _isEmployed
    ) public {
        profiles[msg.sender] = Profile(_name, _age, _isEmployed);
    }

    // view profile

    function getMyProfile()
        public
        view
        returns (
            string memory,
            uint256,
            bool
        )
    {
        Profile memory p = profiles[msg.sender];
        return (p.name, p.age, p.isEmployed);
    }
}

// create a register that adds new ID for new students

contract studentRegistry {
    struct Student {
        string name;
        uint256 age;
        string grade;
    }

    // we use map here as done previously

    mapping(uint => Student) private students;

    // function to add or update students

    function addStudent(
        uint256 _id,
        string memory _name,
        uint256 _age,
        string memory _grade
    ) public {
        students[_id] = Student(_name, _age, _grade);
    }

    // get student details by ID 

    function get(uint _id) public view returns (string memory, uint, string memory){

        Student memory s = students[_id]; 
        return(s.name, s.age, s.grade);

    } 


}
