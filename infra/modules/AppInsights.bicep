param config object

resource apps 'Microsoft.Insights/components@2020-02-02' = {
  name: config.name
  location: config.location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output instrumentationKey string = apps.properties.InstrumentationKey
output connectionString string = apps.properties.ConnectionString
