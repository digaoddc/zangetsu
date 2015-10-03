module Zangetsu
  class Project
    attr_accessor :id, :name, :episodes_number, :genres, :status, :quality, :last_update

    def initialize(args)
      self.id               =  args.fetch(:id)
      self.name             =  args.fetch(:name)
      self.episodes_number  =  args.fetch(:episodes_number)
      self.genres           =  args.fetch(:genres)
      self.status           =  args.fetch(:status)
      self.quality          =  args.fetch(:quality)
      self.last_update      =  args.fetch(:last_update)
    end

    def self.all_by_driver(driver=nil)
      drivers_list = Array.new(driver || Zangetsu::DRIVERS)

      [].tap do |list_projects|
        drivers_list.each do |driver|
          driver.projects.map { |p| list_projects << Project.new(p) }
        end
      end
    end

  end
end

