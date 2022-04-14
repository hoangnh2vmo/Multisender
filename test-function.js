const Web3 = require("web3");

const web3 = new Web3(
  "https://rinkeby.infura.io/v3/afa9553623db44b388348836b654f819"
);

web3.eth
  .getTransaction(
    "0x03b9211be47b23b582b985e4139b616fc3580602801db39f41533785b8b8696b"
  )
  .then(console.log);
