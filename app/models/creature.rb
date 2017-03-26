class Creature < ApplicationRecord

  validates :name, presence: true
  validates :wiki_url, presence: true
  validates :exp, presence: true, numericality: true
end
