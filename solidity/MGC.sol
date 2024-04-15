// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MGC is ERC20, Ownable(msg.sender) {
    constructor() ERC20("MGC", "MGC") {
        _mint(msg.sender, 10000000000 * 10**uint256(decimals()));
    }

    function airdrop(address[] memory _tos, uint256[] memory _amounts)
        public
        returns (bool)
    {
        require(_tos.length > 0);
        require(_tos.length == _amounts.length);

        for (uint32 i = 0; i < _tos.length; i++) {
            _transfer(msg.sender, _tos[i], _amounts[i]);
        }

        return true;
    }
}
