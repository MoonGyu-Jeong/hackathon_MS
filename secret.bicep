@secure()
param myPassword string
resource sqlserver 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: 'moonServer'
  location: 'eastus'
  properties: {
    administratorLogin: 'moon'
    administratorLoginPassword: myPassword
  }
  resource sqldb 'databases' = {
    name: 'moondb'
    location: 'eastus'
  }
}
