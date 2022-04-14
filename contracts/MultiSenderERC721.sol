// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MultiSenderERC721 {
    function sendMultiERC721(
        address addressERC721,
        address[] memory listReceivers,
        uint256[] memory listTokenId
    ) public payable returns (bool) {
        require(listReceivers.length == listTokenId.length, "Not same length");

        uint256 totalReceivers = listReceivers.length;
        IERC721 erc721 = IERC721(addressERC721);

        for (uint256 i = 0; i < totalReceivers; i++) {
            require(
                erc721.ownerOf(listTokenId[i]) == msg.sender,
                "Token not owned by sender"
            );
        }

        for (uint256 i = 0; i < totalReceivers; i++) {
            require(
                erc721.isApprovedForAll(msg.sender, address(this)),
                "Not approved"
            );
            erc721.transferFrom(msg.sender, listReceivers[i], listTokenId[i]);
        }
        return true;
    }
}
