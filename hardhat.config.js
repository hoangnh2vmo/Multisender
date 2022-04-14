/**
Successfully submitted source code for contract
contracts/MultiSender.sol:MultiSender at 0x4d705598c4E0FEbEc7E7a5d3799A05c95C686714
for verification on the block explorer. Waiting for verification result...

Successfully verified contract MultiSender on Etherscan.
https://rinkeby.etherscan.io/address/0x4d705598c4E0FEbEc7E7a5d3799A05c95C686714#code


 */
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

const RINKEBY_PRIVATE_KEY =
  "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
module.exports = {
  solidity: "0.8.1",
  networks: {
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/afa9553623db44b388348836b654f819`,
      accounts: [`${RINKEBY_PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`,
  },
};
