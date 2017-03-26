module Scraper
  module TibiaWiki
    class CreatureRow

      def initialize(row)
        @row = row
      end

      def name
        row.children[1].children.first.attributes['title'].value
      end

      def image_url
        row.children[2].children[1].attributes['href'].value
      end

      def wiki_path
        BASE_URL + row.children[1].children.first.attributes['href'].value
      end

      def exp
        parse_exp(row.children[3].children.first.text)
      end

      private

      attr_reader :row

      def parse_exp(string)
        string.gsub('/n', '').gsub('?', '0').gsub('~', '')
      end

    end
  end
end