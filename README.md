# AzureAuth

azure_auth uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc.

## Installation

Add this line to your application's Gemfile:

    gem 'azure_auth'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install azure_auth

## Usage

1- You need to run:

    $ rails g azure_auth:steps
    
   to create the authentication controller that handle the authentication process.
    
2- Use "/authenticate" url to start the authentication process.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
