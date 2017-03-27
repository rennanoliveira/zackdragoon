require_relative '../scraper/tibia_wiki/tibia_wiki'

namespace :tibiawiki do
  desc 'populates the db with tibiawiki creature info'
  task populate: :environment do
    print 'Scraping.'
    Scraper::TibiaWiki::TibiaWikiScraper.new.creatures.each do |creature|
      print '.'
      ::Creature.create(
        name: creature.name,
        image_url: creature.image_url,
        wiki_url: Scraper::TibiaWiki::BASE_URL + creature.wiki_path,
        exp: creature.exp
      )
    end
    print '.'
    puts 'Creature scraping complete.'
  end
end
