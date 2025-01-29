terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  client_id = "27b823ed-3629-42c2-8a47-4bd5e734a8a1"
  client_secret = "DFS8Q~BfvdZAptBD7Z94tRvUXLFhI3PIQ1k8BbrZ"
  tenant_id = "b5db11ac-8f37-4109-a146-5d7a302f5881"
  subscription_id = "99cb61e0-6f5e-453f-9bf6-bc478df73d4b"
}