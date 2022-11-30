param location string = resourceGroup().location
param storageAccountName string = 'moon${uniqueString(resourceGroup().id)}'
param globalRedundancy bool

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: globalRedundancy ? 'Standard_GRS' : 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource storageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: '${storageAccount.name}/default/firstcontainer'
  properties: {}
}

output name string = storageAccount.name
output endpoint string = storageAccount.properties.primaryEndpoints.blob
