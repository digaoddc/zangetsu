require 'rest-client'

module Zangetsu
  require_relative 'zangetsu/drivers/punchsub.rb'
  require_relative 'zangetsu/projects.rb'
  require_relative 'zangetsu/version.rb'

  DRIVERS = [
    Drivers::Punchsub
  ]

  def self.available_projects
    Project.all
  end
end