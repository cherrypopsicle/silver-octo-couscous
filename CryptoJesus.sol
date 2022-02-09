pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

// OpenZeppelin contracts
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract CryptoJesus is Ownable, ERC721 {
    using Strings for uint256;

    uint public tokenId = 0;

    // contract URIs
    string private _contractURI =
        "ipfs://QmSm9ow2cdJUk1e1Xm8t8DrkHGyaakd6j7bHZxwe7nxkoX";
    string private _ipfsFolder =
        "ipfs://QmdC3m6iJP9qNUyxpAqquAsXwbS8T2knBG4Ga9ocCpQxWK/";

    // constructor
    constructor() ERC721("CryptoJesus Genesis", "CJG") {}

    // for opensea standards
    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    function mint() public payable {
        require(tokenId < 111, "Max amount of tokens reached!");
        require(msg.value == 0.08 ether, "Not enough funds!");
        _mint(msg.sender, tokenId++);
    }


    // the overridden _baseURI from ERC721
    function _baseURI() internal view virtual override returns (string memory) {
        return _ipfsFolder;
    }
}
