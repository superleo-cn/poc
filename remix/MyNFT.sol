// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("My Test NFT", "FUN") {}

    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        // 购买的NFT，ID默认从0开始计算
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }


    // STEP1 :A的NFT允许被B购买
    // from: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 mint多个地址
    // to: 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db 想从from购买
    // 代理: 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB 合约地址
    // 以下是伪代码逻辑
    function approve(uint256 itemId) public {
        // 1. 将钱包切到from，执行代码 允许proxy，即合约本身帮助from卖出NFT
        approve(address(this), itemId);
    }

  
    // STEP2: B购买A的NFT
    // from: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 mint多个地址
    // to: 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db 想从from购买
    // 以下是逻辑说明
    // @param from: 卖家的地址
    // @param to: 卖家的地址
    // @param tokenId: NFT的编号
    // @param amount: NFT的价格，用于校验使用 1000000000000000000 (1 ether)
    function transferNFTAndETH(address from, address to, uint256 tokenId, uint256 amount) external payable {
        require(msg.value == amount, "The price is incorrect");
        // 把A的NFT转给B
        safeTransferFrom(from, to, tokenId);
        // 扣除B的Either，并且转给A
        payable(from).transfer(amount);
    }

}