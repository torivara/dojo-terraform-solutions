# resource "azurerm_mssql_server" "sqlsrv" {
#   name                         = local.sql_server_name
#   resource_group_name          = azurerm_resource_group.rg.name
#   location                     = azurerm_resource_group.rg.location
#   version                      = "12.0"
#   administrator_login          = "4dm1n157r470r"
#   administrator_login_password = "4-v3ry-53cr37-p455w0rd"
#   azuread_administrator {
#     azuread_authentication_only = true
#     login_username              = var.sql_login_username
#     object_id                   = var.sql_login_object_id
#   }
# }

# resource "azurerm_mssql_database" "sqldb" {
#   name         = local.sql_database_name
#   server_id    = azurerm_mssql_server.sqlsrv.id
#   collation    = "SQL_Latin1_General_CP1_CI_AS"
#   license_type = "LicenseIncluded"
#   max_size_gb  = 50
#   sku_name     = "S0"
# }
