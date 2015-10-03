module Zangetsu
  class Projects
    attr_reader :projects
    def initialize
      @projects = []
    end

    def fetch
      response_parsed.map do |anime_info|
       {
          id:             anime_info[0],
          name:           anime_info[1],
          episodes:       anime_info[6],
          genres:         anime_info[4].split(","),
          status:         anime_info[8],
          quality:        anime_info[5],
          last_update:    anime_info[7]
        }
      end
    end

    private
    attr_writer :projects

    def response_parsed
      resp        =  RestClient.get(source_url)
      animes_raw  =  JSON.parse(resp)
    end

    def source_url
      'http://punchsub.net/lista-de-animes'
    end
  end
end

