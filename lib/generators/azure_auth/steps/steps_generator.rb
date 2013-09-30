require 'rails/generators'

module AzureAuth
  class StepsGenerator < Rails::Generators::Base
    def generate
      copy_file 'auth_controller.rb', 'app/controllers/auth_controller.rb'
    end

    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end
  end
end