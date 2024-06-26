provider "azurerm" {
    version = "2.5.8"
    features {}
}

resource "azure_resource_group" "tf_test" {
    name = "tfmaining"
    location = "Australia East"
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "binarythistlewa"
    os_type = "Linux"

    container {
        name = "weatherapi"
        image = "binarythistle/weatherapi"
        cpu = "1"
        memory = "1"

        ports {
            port = 80
            protocol = "TCP"
        }
    }
}