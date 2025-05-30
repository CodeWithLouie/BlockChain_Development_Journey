// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// you can declare a custom data type such as struct on a file level i.e constant data
// However you can declare state variable on a file level
// what I deduce was that state variables are to be called inside a contract

// This is a custom data type called struct that holds different value
// I created this variable on a file level
struct MyCredentials {
    string userID; // a string with no assigned value
    string username; // a string with no assigned value
    uint256 password; // an unsigned interger with no assigned value
}

// to create a contract, you must first call the word contract followed by your specified contract name
contract LearnStruct {
    // contract name
    struct Myprofile {
        // I created a custom data type inside the contract
        string name; // state variable inside a struct
        uint256 age; // state variable inside a struct
        string race; // state variable inside a struct
        string country; // state variable inside a struct
        uint256 weight; // state variable inside a struct
        uint256 height; // state variable inside a struct
    }

    Myprofile public profile; // create a state variable of custom type

    // Functions are structured in this manner below
    // function "name of function"(data type1 argument name1, data type2 argument name2) function modifier

    function customProfile(
        // create a function by calling the word function and then function name
        string memory _name,
        uint256 _age,
        string memory _race,
        string memory _country,
        uint256 _weight,
        uint256 _height
    ) public {
        profile = Myprofile(_name, _age, _race, _country, _weight, _height);
    }

    function getProfile()
        public
        view
        returns (
            string memory,
            uint256,
            string memory,
            string memory,
            uint256,
            uint256
        )
    {
        return (
            profile.name,
            profile.age,
            profile.race,
            profile.country,
            profile.weight,
            profile.height
        );
    }
}

// here I am creating a contract that calls the struct data type I created on the file level
contract externalStruct {
    MyCredentials public credentials; // declaring the custom data type

    function externalData(
        string memory _userID,
        string memory _username,
        uint256 _password
    ) public {
        credentials = MyCredentials(_userID, _username, _password);
    }

    function getExternaData()
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        return (credentials.userID, credentials.username, credentials.password);
    }
}

// storing multiple person's profile using array of struct

contract multipleStruct {
    // a custom data type for the profile
    struct Profile {
        string name;
        uint256 age;
        bool isMarried;
    }

    // creating a dynamic array so we can store multiple person's profile

    Profile[] public profiles;

    // Now let's add a new person to the array

    function addPerson(
        string memory _name,
        uint256 _age,
        bool _isMarried
    ) public {
        profiles.push(Profile(_name, _age, _isMarried));
    }

    // get info from the array by index

    function getIndex(uint256 index)
        public
        view
        returns (
            string memory,
            uint256,
            bool
        )
    {
        Profile memory p = profiles[index];
        return (p.name, p.age, p.isMarried);
    }

    // Get total number of profiles

    function getCount() public view returns (uint256) {
        return profiles.length;
    }
}

// Problem exercise

contract contact {
    struct Contact {
        string name;
        string phoneNumber;
    }

    Contact[] public cont;

    function addcontact(string memory _name, string memory _phoneNumber)
        public
    {
        cont.push(Contact(_name, _phoneNumber));
    }

    function getIndex(uint256 Index)
        public
        view
        returns (string memory, string memory)
    {
        Contact memory p = cont[Index];
        return (p.name, p.phoneNumber);
    }

    function getter() public view returns (uint256) {
        return cont.length;
    }
}


