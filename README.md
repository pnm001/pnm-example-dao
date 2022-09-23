# Sample Project: Vault

This reproduces [the infamous DAO hack](https://quantstamp.com/blog/what-is-a-re-entrancy-attack).

## Invariant
Without interacting with the vault contract on behalf of the benign user(s), the balance of the vault contract has a lower bound.

In our example test, `1 ether` is the amount the benign user owned in the vault.
```
address(vault).balance >= 1 ether
```

## Test File
[TestBalance.t.sol](./test/pnm/TestBalance.t.sol)
