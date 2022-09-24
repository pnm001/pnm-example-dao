// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./VaultTest.t.sol";

contract BalanceTest is VaultTest {
    function setUp() external {
        // Step 1. Deploy the smart contracts
        deploy();

        // Step 2. User owned 1 ether in the vault
        deposit(USER, 1 ether);

        // Step 3. Attacker (we) owned 0.0000000000001 ether in the vault
        deposit(address(this), 100000 wei);
    }

    function invariantBalanceLowerLimit() external view {
        // INVARAINT:
        // The vault should always have at least 1 ether.
        // Otherwise, User cannot get the fund back.  
        // require(address(vault).balance >= 1 ether, "User fund loss");
    }
}
