// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.8.4;

import { FlashLoanReceiverBase } from "./FlashLoanReceiverBase.sol";
import { ILendingPool, ILendingPoolAddressesProvider} from "./Interfaces.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

/**
    Never keep funds s permanently on your FlashLoanReceiverBase contract as they could be
    exposed to a 'griefing' attack,where the stored funds are used by an attacker.
 */

contract MyV2FlashLoan is FlashLoanReceiverBase {
    using SafeMath for uint256;

    address public lendingPoolAddressesProvider = 0x88757f2f99175387aB4C6a4b3067c77A695b0349;
    address public kovanUsdt = 0x13512979ADE267AB5100878E2e0f485B568328a4;
    address public kovanUsdc = 0xe22da380ee6B445bb8273C81944ADEB6E8450422;
    address public kovanAave = 0xB597cd8D3217ea6477232F9217fa70837ff667Af;
    address public kovanDai = 0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD;
    address public kovanLink = 0xAD5ce863aE3E4E9394Ab43d4ba0D80f419F61789;

    constructor(ILendingPoolAddressesProvider _addressProvider)FlashLoanReceiverBase(_addressProvider)  {}

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    )
    external
    override
    returns (bool)
    {
        //
        // This contract now has the founds request.
        // Your logic goes here.
        //

        // At the end of your logic above, this contract owes
        // the flashloaned amounts + premiums.
        // Therefore ensure your contract has enough to repay
        // these amounts.
        //

        // Approve the LendingPool contract allowance to *pull* the owed amount
        for (uint i = 0; i < assets.length; i++) {
            uint amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
        }

        return true;
    }

    function myFlashLoanCall() public {
        address receiverAddress = address(this);

        address[] memory assets = new address[](1);
        assets[0] = kovanUsdt;

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = 10;

        // 0 = flashLoan, 1 = stable, 2 = variable
        uint256[] memory modes = new uint256[](1);
        modes[0] = 0;

        address onBehalfOf = address(this);
        bytes memory params = "Test flashLoan";
        uint16 referralCode = 0;

        LENDING_POOL.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
    }
}
