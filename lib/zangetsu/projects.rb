module Zangetsu
  class Project
    SOURCE_URL = 'http://punchsub.net/lista-de-animes'
    attr_accessor :id, :name, :episodes_number, :genres, :status, :quality, :last_update

    def initialize(params)
      self.id               =  params[0]
      self.name             =  params[1]
      self.episodes_number  =  params[6]
      self.genres           =  params[4].split(',')
      self.status           =  params[8]
      self.quality          =  params[5]
      self.last_update      =  params[7]
    end

    def self.all
      response_parsed.map do |anime_info|
        Project.new(anime_info)
      end
    end

    private

    def self.response_parsed
      resp        =  RestClient.get(SOURCE_URL)
      animes_raw  =  JSON.parse(resp)
    end
  end
end

