require 'rest-client'

require File.join(File.dirname(__FILE__), "zangetsu", "version")
require File.join(File.dirname(__FILE__), "zangetsu", "projects")

module Zangetsu
  def self.available_projects
    Project.all
    # projects.fetch
  end
end