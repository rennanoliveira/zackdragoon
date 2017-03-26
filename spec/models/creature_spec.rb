require 'rails_helper'

RSpec.describe Creature, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:wiki_url) }
  it { is_expected.to validate_presence_of(:exp) }
  it { is_expected.to validate_numericality_of(:exp) }
end
