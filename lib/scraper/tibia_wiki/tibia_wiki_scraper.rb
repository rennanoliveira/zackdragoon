require 'mechanize'
require_relative 'creature_row'

module Scraper
  module TibiaWiki
    # This Class scrapes TibiaWiki creatures.
    # returns an array of Scraper::TibiaWiki::CreatureRow objects
    #  Ex: TibiaWikiScraper.new.creatures
    #     => [<CreatureRow name='Ferumbras', ...>, ...]
    class TibiaWikiScraper
      BASE_URL = 'http://tibia.wikia.com/'.freeze
      TARGET_PATH = 'wiki/List_of_Creatures'.freeze

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
          next if header?(row)
          CreatureRow.new(row)
        end.compact
      end

      def doc
        Nokogiri::HTML(page.body)
      end

      def creature_rows
        doc.css('table.wikitable tr')
      end

      def header?(row)
        row.children[1].name == 'th'
      rescue
        false
      end
    end
  end
end
