// SPDX-Licence-Identifier: UNLICENSED

pragma solidity ^0.8.17;

// Import openZeppelin contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

//Groot inherits from the imported contracts above to have access to openZeppelin contracts
contract GrootNFT is ERC721URIStorage {

    //to keep track of tokenId
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("Groot Collection", "GROOT"){
        console.log("Groot's Nft collection!");
    }

    function makeGrootNFT() public {
        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "https://jsonkeeper.com/b/AQ28");

        _tokenIds.increment();

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    }

}