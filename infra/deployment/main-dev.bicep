// **************** PARAMETERS *********************** //

@description('The name of the Web App')
param webAppName string

@description('App Service Plan SKU')
param sku string

@description('Runtime stack for the Web App (Linux)')
param linuxFxVersion string

@description('Deployment location')
param location string = resourceGroup().location

// **** demo-rg **** /




// **** FOTS-app-dev-rg **** /


module appService '../modules/AppServiceForPython.bicep' = {
  name: 'deployAppService'
  params: {
    webAppName: webAppName
    sku: sku
    linuxFxVersion: linuxFxVersion
    location: location
  }
}
