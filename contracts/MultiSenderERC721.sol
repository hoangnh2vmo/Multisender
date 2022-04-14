// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface IMultiSenderERC721 {
    function sendMultiERC721(
        address addressERC721,
        address[] memory listReceivers,
        uint256[] listTokenId
    ) external payable returns (bool);
}

// TODO 
contract MultiSenderERC721 is IMultiSenderERC721 {
    function sendMultiERC721(
        address addressERC721,
        address[] memory listReceivers,
        uint256[] listTokenId
    ) public payable override returns (bool) {
        uint256 totalReceivers = listReceivers.length;
        IERC721 erc721 = IERC721(addressERC721);
        require(
            erc721.balanceOf(msg.sender) >= totalReceivers * amount,
            "Total balance not enough"
        );

        uint256 allowance = erc721.allowance(msg.sender, address(this));
        require(
            allowance >= totalReceivers * amount,
            "Check the token allowance"
        );
        for (uint256 i = 0; i < totalReceivers; i++) {
            erc721.transferFrom(msg.sender, listReceivers[i], amount);
        }
        return true;
    }
}
