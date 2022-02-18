# ETHDenver 2022 Smart Contract Developer Bootcamp

Set of excercises made during ETHDenver Bootcamp hosted by ChainLink on March 2022 👨‍💻
(![ETHDenver 2022 Smart Contract Developer Bootcamp](https://raw.githubusercontent.com/SSantiago90/chainlink-bootcamp/master/preview.png))
## Instructions

Given instructions found on this [doc](https://docs.google.com/document/d/e/2PACX-1vRMqvdbtMwWXX1MheWy52M8CUj7FhSuLVXWl9_fmshLoWw6OX8ovBV0P7-YCgigomSg3HsEgE4ZGx1b/pub).
> Document published and mantained by Chainlink  - it may not be available in the future.

## Framework

Developed with [truffle suite]("https://trufflesuite.com/").
Using [Solidity 0.8.7](https://solidity-es.readthedocs.io/es/latest/) Smart Contract language.

# How to run

####  Install truffle tools locally
- `npm install -g truffle` 

####  Install NPM dependencies 
- `npm install`

#### run truffle enviroment and CLI (includes local Ethereum Virtual Blockchain for testing)
- `truffle development`

### Inside truffle CLI
#### Compile contracts and migrate/deploy to blockchain (inside)
- `compile`
- `migrate`

#### Create instance and interact with given contract
- `let contractInstance = await {ContractName}.deployed();`
- `contractInstance.callSomeMethod();`

> Check out truffle documentation for more info about how to interact with contracts


# TO-DO's

- Develop more contracts!
- Front-End UI/App using Javascript/React with [Drizzle framework](https://trufflesuite.com/drizzle/)
- Deploy on Ethereum Test Net