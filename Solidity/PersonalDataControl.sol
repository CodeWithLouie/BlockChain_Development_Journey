// SPDX-License-Identifier: MIT
pragma solidity 0.8.5;

contract PersonalData {
    string public name;
    uint256 public age;
    bool public isMarried;
    address public wallet;
    bytes32 public personalHash;
    int256 public netWorth;

    function setProfile(
        string memory _name,
        uint256 _age,
        bool _isMarried,
        bytes32 _personalHash
    ) public {
        name = _name;
        age = _age;
        isMarried = _isMarried;
        wallet = msg.sender;
        personalHash = _personalHash;
        netWorth = 0;
    }

    function updateNetworth(int256 _networth) public {
        netWorth = _networth;
    }

    function toggleMarried() public {
        isMarried = !isMarried;
    }

    function getProfile()
        public
        view
        returns (
            string memory,
            uint256,
            bool,
            address,
            bytes32,
            int256
        )
    {
        return (name, age, isMarried, wallet, personalHash, netWorth);
    }
}
