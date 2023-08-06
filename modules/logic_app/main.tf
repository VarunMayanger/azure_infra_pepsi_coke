resource "azurerm_logic_app_workflow" "mrmayangerlogicapp" {
  name                = "mrmayangerlogicapp1"
  location            = var.location
  resource_group_name = var.rg_name
}

## A custom action in logic app
resource "azurerm_logic_app_action_custom" "mrmayangerlogicappcustomaction" {
  name         = "mrmayangerlogicapp1-Custom-action-1"
  logic_app_id = azurerm_logic_app_workflow.mrmayangerlogicapp.id

  body = <<BODY
{
    "description": "A variable to configure the auto expiration age in days. Configured in negative number. Default is -30 (30 days old).",
    "inputs": {
        "variables": [
            {
                "name": "ExpirationAgeInDays",
                "type": "Integer",
                "value": -30
            }
        ]
    },
    "runAfter": {},
    "type": "InitializeVariable"
}
BODY

}