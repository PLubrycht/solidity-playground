// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IHelloWorld {
    function helloWorld() external view returns (string memory);
    function setText(string calldata newText) external;
    function getrandomText() external view returns (string memory);
    function callWrongExecution() external ;
}

contract HelloWorld {
    string private text;

    constructor() {
        text = initialText();
    }

    function helloWorld() public view returns (string memory) {
        return text;
    }

    function setText(string calldata newText) public {
        text = newText;
    }

    function initialText() public pure returns (string memory) {
        return "Hello World";
    }

    fallback() external  { 
        text = "WRONG!!!";
    }

}

contract GreetingsInvoker {
    function invokeGreeting(address target) public view returns (string memory){
        return IHelloWorld(target).helloWorld();
    }

    function setGreeting(address target, string calldata newText) public {
        IHelloWorld(target).setText(newText);
    }

    function invokeWrongExecution(address target) public {
        IHelloWorld(target).callWrongExecution();
    }
}