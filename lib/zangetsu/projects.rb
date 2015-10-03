module Zangetsu
  class Project
    SOURCE_URL = 'http://punchsub.net/lista-de-animes'
    attr_accessor :id, :name, :episodes_number, :genres, :status, :quality, :last_update

    def self.all
      response_parsed.map do |anime_info|
        Project.new.tap do |p|
          p.id               =  anime_info[0]
          p.name             =  anime_info[1]
          p.episodes_number  =  anime_info[6]
          p.genres           =  anime_info[4].split(",")
          p.status           =  anime_info[8]
          p.quality          =  anime_info[5]
          p.last_update      =  anime_info[7]
        end
      end
    end

    private

    def self.response_parsed
      resp        =  RestClient.get(SOURCE_URL)
      animes_raw  =  JSON.parse(resp)
    end
  end
end

