param rgName string
param location string
param environment string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: {
    Environment: environment
    CreatedWith: MeerinIacPipeline
  }
}
