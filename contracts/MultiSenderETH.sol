// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";

contract MultiSenderETH {
    function sendMultiETH(
        address payable[] memory listReceivers,
        uint256[] memory listAmounts
    ) public payable {
        uint256 totalReceivers = listReceivers.length;
        uint256 totalAmounts;
        for (uint256 i = 0; i < totalReceivers; i++) {
            totalAmounts += listAmounts[i];
        }
        require(msg.sender.balance >= totalAmounts, "Total balance not enough");
        require(msg.value == totalAmounts, "Value not enough");
        for (uint256 i = 0; i < totalReceivers; i++) {
            (bool success, bytes memory data) = listReceivers[i].call{
                value: listAmounts[i]
            }("");
            delete data;
            require(
                success,
                string(
                    abi.encodePacked(
                        "Transaction ",
                        Strings.toString(i),
                        " failed"
                    )
                )
            );
        }
    }
}
