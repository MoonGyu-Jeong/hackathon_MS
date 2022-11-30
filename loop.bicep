param names array

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' existing = {
  name: 'moonuon6nhfqs2ayk'
}

resource storageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = [for name in names : {
  name: '${storageAccount.name}/default/loop${name}'
  properties: {}
}]
