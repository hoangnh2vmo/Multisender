// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IMultiSenderERC20 {
    function sendMultiERC20(
        address addressERC20,
        address[] memory listReceivers,
        uint256 amount
    ) external payable returns (bool);
}

contract MultiSenderERC20 is IMultiSenderERC20 {
    function sendMultiERC20(
        address addressERC20,
        address[] memory listReceivers,
        uint256 amount
    ) public payable override returns (bool) {
        uint256 totalReceivers = listReceivers.length;
        IERC20 erc20 = IERC20(addressERC20);
        require(
            erc20.balanceOf(msg.sender) >= totalReceivers * amount,
            "Total balance not enough"
        );

        uint256 allowance = erc20.allowance(msg.sender, address(this));
        require(
            allowance >= totalReceivers * amount,
            "Check the token allowance"
        );
        for (uint256 i = 0; i < totalReceivers; i++) {
            erc20.transferFrom(msg.sender, listReceivers[i], amount);
        }
        return true;
    }
}
