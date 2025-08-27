// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // Stored number (readable from outside because it's public)
    int256 public value;

    // Optional: set a starting value (default would be 0 if you remove the constructor)
    constructor(int256 _initialValue) {
        value = _initialValue;
    }

    // Increase by 1
    function increment() external {
        value += 1;
    }

    // Decrease by 1
    function decrement() external {
        value -= 1;
    }

    // (Optional) separate read function; not required since 'value' is public
    function getValue() external view returns (int256) {
        return value;
    }
}
