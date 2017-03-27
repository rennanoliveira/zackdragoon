module Scraper
  module TibiaWiki
    # Reads a tibiawiki creature table row, withdrawing attributes from it.
    # Input:
    # CreatureRow.new(row).name
    # => 'Ferumbras'
    class CreatureRow
      attr_reader :name, :image_url, :wiki_path, :exp

      def initialize(row)
        load_name(row)
        load_image_url(row)
        load_wiki_path(row)
        load_exp(row)
      end

      def load_name(row)
        @name = row.children[1].children.first.attributes['title'].value
      end

      def load_image_url(row)
        @image_url = row.children[2].children[1].attributes['href'].value
      end

      def load_wiki_path(row)
        @wiki_path = [
          BASE_URL,
          row.children[1].children.first.attributes['href'].value
        ].join
      end

      def load_exp(row)
        @exp = parse_exp(row.children[3].children.first.text)
      end

      private

      def parse_exp(string)
        string.gsub('\n', '').tr('?', '0').tr(' ', '').delete('~').to_i
      end
    end
  end
end
