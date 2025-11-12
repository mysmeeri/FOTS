// **************** PARAMETERS *********************** //


var param = json(loadTextContent('../variables/dev/parameters.json'))

var settings = param

// **** DEPLOY RG **** /


param rgName string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: {
    CreatedWith: 'SimplePipeline'
  }
}
