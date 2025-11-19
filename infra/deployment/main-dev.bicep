// **************** PARAMETERS *********************** //

param keyVault object
param appService object
//param appInsights object

targetScope = 'subscription'

// **** demo-rg **** /


module keyVaultModule '../modules/KeyVault.bicep' = {
  name: 'keyVaultDeployment'
  scope: resourceGroup(keyVault.resourceGroup)
  params: {
    config: keyVault
  }
}


// **** FOTS-app-dev-rg **** /


var planName = '${appService.name}-ASP'

module planModule '../modules/AppServicePlanForPython.bicep' = {
  name: 'ASPDeployment'
  scope: resourceGroup(appService.resourceGroup)
  params: {
    name: planName
    location: appService.location
    sku: appService.sku
  }
}


module appModule '../modules/AppServiceForPython.bicep' = {
  name: 'appServiceDeployment'
  scope: resourceGroup(appService.resourceGroup)
  params: {
    name: appService.name
    linuxFxVersion: appService.linuxFxVersion
    location: appService.location
    ASPplanId: planModule.outputs.id
  }
}


// TO-DO APP INSIGHTS DEPLOYMENT INTO APP SERVICE RG
