// **************** PARAMETERS *********************** //

@description('Key Vault configuration')
param keyVault object


// **** demo-rg **** /

// Deploy key vault
module keyVaultModule '../modules/KeyVault.bicep' = {
  name: 'keyVaultDeployment'
  scope: resourceGroup(keyVault.resourceGroup)
  params: {
    config: keyVault
  }
}



// **** FOTS-app-dev-rg **** /

/*
module appService '../modules/AppServiceForPython.bicep' = {
  name: 'deployAppService'
  params: {
    webAppName: appService.name
    sku: appService.sku
    linuxFxVersion: appService.linuxFxVersion
    location: appService.location
  }
}
*/
