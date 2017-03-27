require 'mechanize'
require_relative 'creature_row'

module Scraper
  module TibiaWiki
    # This Class scrapes TibiaWiki creatures and returns an array.
    #  Format: [[name, link_to_image, link_to_wiki_page, exp_points]]
    #  Ex: TibiaWikiScraper.new.creatures
    #     => [['Ferumbras', 'link_to_image', 'link_to_wiki_page', 999], ...]
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
          creature_row = CreatureRow.new(row)
          creature_to_a(creature_row)
        end
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

      def creature_to_a(creature_row)
        [
          creature_row.name,
          creature_row.image_url,
          creature_row.wiki_url,
          creature_row.exp
        ]
      end
    end
  end
end
