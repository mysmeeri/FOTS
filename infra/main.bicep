param rgName string
param location string
param environment string

module rgModule './modules/ResourceGroup.bicep' = {
  name: 'deployRG'
  scope: subscription() // make the scope explicit
  params: {
    rgName: rgName
    location: location
    environment: environment // you missed this one
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
