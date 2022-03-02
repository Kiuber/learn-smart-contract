// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract A {

    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function getContractName() public view virtual returns (string memory) {
        return name;
    }
}

// contract B is A {
//     function getContractName() public pure override(A) returns (string memory) {
//         return "B";
//     }
// }


// contract B is A("B") {
// }

// contract B is A {
//     constructor() A ("This is B") {
//     }
// }

// contract B is A {
//     string helloworld;

//     constructor(string memory _name, string memory _helloworld) A(_name) {
//         helloworld = _helloworld;
//     }
// }

contract B {
    string public helloworld;

    constructor(string memory _helloworld) {
        helloworld = _helloworld;
    }

    function getHelloWorld() public view virtual returns (string memory) {
        return helloworld;
    }
}

contract C is A("A"), B("B") {

}

contract C2 is A, B {
    constructor() A("A") B("B") {

    }
}

contract C3 is A, B {
    constructor(string memory _name, string memory _helloworld) A(_name) B(_helloworld) {

    }
}