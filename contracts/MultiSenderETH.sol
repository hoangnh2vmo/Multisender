// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// TODO fix bug
contract MultiSenderETH {
    function sendMultiETH(
        address payable[] memory listReceivers,
        uint256[] memory listAmounts
    ) public payable {
        uint256 totalReceivers = listReceivers.length;
        // require(
        //     msg.sender.balance >= totalReceivers * msg.value,
        //     "Total balance not enough"
        // );
        for (uint256 i = 0; i < totalReceivers; i++) {
            listReceivers[i].transfer(listAmounts[i]);
        }
    }
}

// [ "0x20e5f90F0013e59Aa3B0cfeC832815db187b05FA" , "0x627306090abaB3A6e1400e9345bC60c78a8BEf57"    ]
