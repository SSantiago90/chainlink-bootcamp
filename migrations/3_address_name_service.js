var AddressNameService = artifacts.require("AddressNameService");
var PhoneNumbers = artifacts.require("PhoneNumbers");

module.exports = function(deployer){
    deployer.deploy(AddressNameService).then( async (res) => {
        console.log("AddressNameService deployed at: " + res.address);
        let instance = await AddressNameService.deployed();
        deployer.deploy(PhoneNumbers).then( (res) => {
            console.log("PhoneNumbers deployed at: " + res.address);
        })
    });
}