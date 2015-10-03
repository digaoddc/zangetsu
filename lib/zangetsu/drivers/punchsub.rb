module Zangetsu
  module Drivers
    class Punchsub
      SOURCE_URL = 'http://punchsub.net/lista-de-animes'

      # All projects must be return a anime list
      # @return [Array[Hash]]
      def self.projects
        response_parsed.map do |anime|
          {
            id:               anime[0],
            name:             anime[1],
            episodes_number:  anime[6],
            genres:           anime[4].split(','),
            status:           anime[8],
            quality:          anime[5],
            last_update:      anime[7]
          }
        end
      end

      private

      def self.response_parsed
        resp        =  RestClient.get(SOURCE_URL)
        animes_raw  =  JSON.parse(resp)
      end
    end
  end
end