require 'mechanize'
require_relative 'creature_row'

module Scraper
  module TibiaWiki
    class TibiaWikiScraper
      BASE_URL = 'http://tibia.wikia.com/'
      TARGET_PATH = 'wiki/List_of_Creatures'

      def initialize(scraper = Mechanize.new)
        @page = scraper.get(BASE_URL + TARGET_PATH)
      end

      def creatures
        @creatures ||= scrape_creatures
      end

      private

      attr_reader :page

      def scrape_creatures
        creature_rows.map do |row|
          next if is_header?(row)
          creature_row = CreatureRow.new(row)
          [creature_row.name, creature_row.image_url, creature_row.wiki_url, creature_row.exp]
        end
      end

      private

      def doc
        Nokogiri::HTML(page.body)
      end

      def creature_rows
        doc.css('table.wikitable tr')
      end

      def is_header?(row)
        begin
          row.children[1].name == 'th'
        rescue
          false
        end
      end
    end

  end
end