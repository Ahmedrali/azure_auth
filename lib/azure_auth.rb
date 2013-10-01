require "azure_auth/version"
module AzureAuth
  class Engine < Rails::Engine
    paths["config/routes"]
  end
end
