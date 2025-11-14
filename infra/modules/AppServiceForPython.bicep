param name string
param linuxFxVersion string
param location string
param ASPplanId string


resource appService 'Microsoft.Web/sites@2023-12-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: ASPplanId
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
