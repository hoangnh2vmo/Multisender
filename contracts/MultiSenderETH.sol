// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;


// TODO fix bug
contract MultiSenderETH {
    function sendMultiETH( address payable[] memory listReceivers)
        public
        payable
        returns (bool)
    {
        uint256 totalReceivers = listReceivers.length;
        require(
            msg.sender.balance >= totalReceivers * msg.value,
            "Total balance not enough"
        );

        for (uint256 i = 0; i < totalReceivers; i++) {
            listReceivers[i].transfer(msg.value);
        }
        return true;
    }
}

// [ "0x75a5D7cDb85b01fe1657A15a397142D27F02DB0A" , "0xBC152B905ADD57ef1947D0877fa2DD7827a53a68"    ]