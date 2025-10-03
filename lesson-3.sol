// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

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

    function _isUnchanged() internal view returns (bool returnValue_) {
        return keccak256(bytes(text)) == keccak256(bytes(initialText()));
    }

    function textHasChanged() public view returns (bool returnValue_) {
        returnValue_ = !_isUnchanged();  
    }

    function _restore() internal {
        text = initialText();
    }

    modifier onlyWhenTextHasChanged() {
        require(textHasChanged());
        _;
    }

    function restore() public onlyWhenTextHasChanged() returns (bool) {
        _restore();
        return true;
    }
}