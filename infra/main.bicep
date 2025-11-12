param rgName string
param location string
param environment string
/*param appServicePlanName string
param sku object*/

module rgModule './modules/ResourceGroup.bicep' = {
  name: 'deployRG'
  params: {
    rgName: rgName
    location: location
    environment: environment()
  }
}

/**module aspModule './modules/AppServicePlan.bicep' = {
  name: 'deployASP'
  scope: resourceGroup(rgName)
  params: {
    appServicePlanName: appServicePlanName
    location: location
    sku: sku
  }
}*/
