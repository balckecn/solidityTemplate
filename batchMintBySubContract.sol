/**
 *Submitted for verification at Etherscan.io on 2023-05-04
*/
pragma solidity ^0.8.0;

interface erc721{
    function mint() external;
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract subContract {
    constructor (address receiver) {
        erc721 erc = erc721("项目合约地址");
        erc.mint();
        erc.transfer(receiver, erc.balanceOf(address(this)));
    }
}

contract BatchMint {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function batchMint(uint count) external {
        for (uint i = 0; i < count;) {
            // 创建子合约
            subContract subCon = new subContract(address(this));
            unchecked {
                i++;
            }
            // 销毁子合约，省gas
            selfdestruct(address(subCon));
        }
    }
}
