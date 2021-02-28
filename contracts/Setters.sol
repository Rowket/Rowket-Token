// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "./Constants.sol";
import "./State.sol";
import "./Getters.sol";

contract Setters is State, Getters {
    
     function addSupportedPool(address pool) internal {
        require(!isSupportedPool(pool),"This pool is already supported");
        _isSupportedPool[pool] = true;
        _supportedPools.push(pool);
    }
    function removeSupportedPool(address pool) internal {
        require(isSupportedPool(pool), "This pool is currently not supported");
        for (uint256 i = 0; i < _supportedPools.length; i++) {
            if (_supportedPools[i] == pool) {
                _supportedPools[i] = _supportedPools[_supportedPools.length - 1];
                _isSupportedPool[pool] = false;
                delete _poolCounters[pool];
                _supportedPools.pop();
                break;
            }
        }
    }
}