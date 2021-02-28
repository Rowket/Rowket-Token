// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

contract State {
    address[] _supportedPools;
    mapping (address => bool) _isSupportedPool;
    bool _taxLess;
    mapping(address=>bool) _isTaxlessSetter;
}