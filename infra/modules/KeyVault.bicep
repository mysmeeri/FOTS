@description('Key Vault configuration object')
param config object

var keyVaultName = config.name
var location = config.location
var skuName = config.sku
var enabledForDeployment = config.enabledForDeployment
var enabledForDiskEncryption = config.enabledForDiskEncryption
var enabledForTemplateDeployment = config.enabledForTemplateDeployment
var tenantId = config.tenantId ?? subscription().tenantId


resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    tenantId: tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    accessPolicies: []
    sku: {
      name: skuName
      family: 'A'
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
  }
}

output name string = kv.name
output location string = location
output resourceGroupName string = resourceGroup().name
output resourceId string = kv.id
