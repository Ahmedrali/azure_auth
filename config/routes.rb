Rails.application.routes.draw do
  get "/authenticate" => "auth#authenticate"
  get "/azure_auth"   => "auth#azure_auth"
end