// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./TestVault.t.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract TestBalance is TestVault {
    function setUp() external {
        // Step 1. Deploy the smart contracts
        deploy();

        // Step 2. User owned 1 ether in the vault
        deposit(USER, 1 ether);

        // Step 3. Attacker (we) owned 100000 wei in the vault
        deposit(address(this), 100000 wei);
    }

    function check() external override {
        uint256 balance = address(vault).balance;

        // INVARAINT:
        // The vault should always have at least 1 ether.
        // Otherwise, User cannot get the fund back.
        require(
            balance >= 1 ether,
            string(
                abi.encodePacked(
                    "[!!!] Invariant violation: vault is stolen (",
                    Strings.toString(balance),
                    ")"
                )
            )
        );
    }
}
