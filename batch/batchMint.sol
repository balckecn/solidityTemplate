/**
 *Submitted for verification at Etherscan.io on 2023-05-04
*/
pragma solidity ^0.8.0;


interface erc721{
    function mint() external;
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract Batchmint {
    constructor() {
        
    }

    function batchMint(uint count) external {
        erc721 erc = erc721(项目方地址);
        for (uint i = 0; i < count;) {
            erc.mint();
            unchecked {
                i++;
            }
            erc.transfer(msg.sender, 1));
        }
    }
}
